import 'dart:convert';
import 'dart:math';

import 'package:core/constant/app_constants.dart';
import 'package:core/database/app_persistence.dart';
import 'package:core/di/locator.dart';
import 'package:core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../network/resource.dart';
import '../network/response/base_response.dart';
import '../shared_data/enum/app_mode.dart';
import '../shared_data/enum/display_settings.dart';
import '../shared_data/enum/snackbar_type.dart';

final appPersistence = locator.get<AppPersistence>();

Resource<T> returnErrorResource<T>(String errorStr) {
  try {
    final errorResp = baseResponseFromJson(errorStr);
    return (errorResp.code == 401)
        ? Resource<T>.Unauthorized()
        : Resource<T>.Error(message: errorResp.message);
  } catch (error) {
    return Resource<T>.Error(message: error.toString());
  }
}

Map<String, dynamic> getBody(Object body) {
  var bodyMap = <String, dynamic>{};
  try {
    (body as Map<String, dynamic>).forEach((key, value) {
      if (value != null) {
        bodyMap[key] = value;
      }
    });
    return bodyMap;
  } catch (error) {
    return bodyMap;
  }
}

extension IntToCurrency on int {
  String toCurrency({bool withSymbol = false}) => NumberFormat.currency(
          locale: "ID", symbol: (withSymbol) ? "Rp " : "", decimalDigits: 0)
      .format(this);
}

extension DoubleToCurrency on double {
  String toCurrency({bool withSymbol = false}) => NumberFormat.currency(
          locale: "ID", symbol: (withSymbol) ? "Rp " : "", decimalDigits: 0)
      .format(this);
}

extension StringNullOrBlank on String? {
  bool isStringNullOrBlank() =>
      (this != null && isBlank == false) ? false : true;
}

extension OrEmptyString on String? {
  String orEmpty() => this ?? '';
}

extension OrStripString on String? {
  String orStrip() => isStringNullOrBlank() ? '-' : orEmpty();
}

extension OrEmptyList<T> on List<T>? {
  List<T> orEmpty() => this ?? [];
}

extension OrZero on int? {
  int orZero() => this ?? 0;
}

extension OrZeroForDouble on double? {
  double orZero() => this ?? 0;
}

extension OrStringZero on String? {
  String orZero() => isStringNullOrBlank() ? '0' : (this ?? '0');
}

extension OrFalse on bool? {
  bool orFalse() => this ?? false;
}

void showSnackbar(
  String message, {
  SnackbarType snackbarType = SnackbarType.SUCCESS,
  String? action = 'OK',
  Function()? onAction,
}) {
  final isMobile = Get.width <= 800;
  final double marginHorizontal = isMobile ? 16 : (Get.width / 3);
  final double marginTop = isMobile ? 0 : 16;
  final double marginBottom = isMobile ? 24 : 0;

  Get.rawSnackbar(
    backgroundColor: (appPersistence.getAppMode() == AppMode.LIGHT)
        ? (snackbarType == SnackbarType.SUCCESS)
            ? SnackbarSuccessLight
            : SnackbarErrorLight
        : (snackbarType == SnackbarType.SUCCESS)
            ? SnackbarSuccessDark
            : SnackbarErrorDark,
    margin: EdgeInsets.fromLTRB(
        marginHorizontal, marginTop, marginHorizontal, marginBottom),
    padding: EdgeInsets.fromLTRB(20, 20, 24, 20),
    mainButton: (action != null && action.isNotEmpty)
        ? TextButton(
            onPressed: () {
              if (onAction != null) onAction();
              Get.closeCurrentSnackbar();
            },
            child: Text(
              action,
              style: Get.textTheme.labelMedium
                  ?.copyWith(color: md_theme_dark_onSecondary),
            ),
            style: TextButton.styleFrom(
                foregroundColor: md_theme_dark_onSecondary),
          )
        : null,
    messageText: Text(
      message,
      style:
          Get.textTheme.labelMedium?.copyWith(color: md_theme_dark_onSecondary),
    ),
    borderRadius: 16,
    snackPosition: isMobile ? SnackPosition.BOTTOM : SnackPosition.TOP,
  );
}

final random = Random();

double doubleInRange(num start, num end) =>
    random.nextDouble() * (end - start) + start;

extension PrettyPrint on Object? {
  void prettyPrint({String title = ''}) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    var prettyString = encoder.convert(this);
    print(title);
    prettyString.split('\n').forEach((element) => print(element));
  }
}

extension IsNumeric on String? {
  bool isNumeric() {
    if (isStringNullOrBlank()) {
      return false;
    }
    return double.tryParse(this ?? '') != null;
  }
}

extension BoolExtension on bool? {
  bool isFalse() => this != true;

  bool isTrue() => this == true;
}

bool isEmailValid(String email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);

extension Let<T> on T? {
  void let(Function(T it) value) {
    if (this != null) {
      value(this as T);
    }
  }
}

Color getRandomPastelColor(AppMode appMode) => HSLColor.fromAHSL(
      1,
      doubleInRange(0, 360),
      doubleInRange(0.25, 0.95),
      (appMode == AppMode.DARK)
          ? doubleInRange(0.85, 0.95)
          : doubleInRange(0.2, 0.4),
    ).toColor();

extension ToMinuteSeconds on int {
  String toMinuteSeconds() {
    try {
      final minute = this ~/ 60;
      final strMinute = (minute < 10) ? "0$minute" : minute.toString();

      final second = this % 60;
      final strSecond = (second < 10) ? "0$second" : second.toString();

      return "$strMinute:$strSecond";
    } catch (_) {
      return "";
    }
  }
}

extension HexStringToColor on String? {
  Color toColor() {
    try {
      if (this == null) return Get.theme.colorScheme.onBackground;

      final colorId = int.parse("$this", radix: 16);
      return Color(colorId);
    } catch (error) {
      return Get.theme.colorScheme.onBackground;
    }
  }
}

extension IsMobile on BuildContext {
  bool isMobile() {
    final displaySettings = appPersistence.getDisplaySettings();

    if (displaySettings.type == DisplaySettings.Auto().type) {
      return MediaQuery.sizeOf(this).shortestSide <=
          AppConstants.MAX_MOBILE_SHORTEST_SIZE;
    } else if (displaySettings.type == DisplaySettings.Desktop().type) {
      return false;
    } else {
      return true;
    }
  }
}

extension StringNumberParserExtension on String? {
  String zeroIfBlankOrNull() => (this == null ||
          (this != null && this?.isEmpty == true) ||
          (this != null && this?.isBlank == true))
      ? "0"
      : this ?? "";

  double toDoubleOrZero({bool withSymbol = false}) {
    try {
      return double.parse(zeroIfBlankOrNull());
    } catch (e) {
      return 0;
    }
  }

  String removeZeroOnDecimal() => orEmpty().contains(".")
      ? zeroIfBlankOrNull()
          .toDoubleOrZero()
          .toPrecisionNumber(2)
          .toString()
          .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")
          .orEmpty()
      : orEmpty();
}

extension PrecisionDouble on double {
  double toPrecisionNumber(int fractionDigits) {
    var mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).ceilToDouble() / mod);
  }
}

extension DoubleParserExtension on double? {
  String removeZeroOnDecimal() => toString().removeZeroOnDecimal();
}
