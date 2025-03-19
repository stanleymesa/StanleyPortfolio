import 'package:core/database/app_persistence.dart';
import 'package:core/di/locator.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final appPersistence = locator.get<AppPersistence>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
