import 'dart:async';

import 'package:core/database/app_persistence.dart';
import 'package:core/di/locator.dart';
import 'package:core/utils/ext.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainController extends GetxController {
  final AppPersistence appPersistence = locator.get<AppPersistence>();
  final ItemScrollController scrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  Timer? timer;

  final _previousScrollOffset = 0.0.obs;
  final _isHeaderInit = false.obs;
  final _scrollDirection = ScrollDirection.IDLE.obs;
  final isShowHeader = true.obs;

  void debounceDelay(Function() action, {int delay = 100}) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: delay), action);
  }

  @override
  void onInit() {
    itemPositionsListener.itemPositions.addListener(() {
      final currentPositions = itemPositionsListener.itemPositions.value;

      if (currentPositions.isNotEmpty) {
        final firstVisibleIndex = currentPositions.first.index;
        final lastVisibleIndex = currentPositions.last.index;
        final currentOffset = itemPositionsListener
                .itemPositions.value.isNotEmpty
            ? itemPositionsListener.itemPositions.value.first.itemLeadingEdge
            : 0.0;

        if (currentOffset > _previousScrollOffset.value) {
          _isHeaderInit.value = true;
          _scrollDirection.value = firstVisibleIndex < 3 || lastVisibleIndex < 3
              ? ScrollDirection.DOWN
              : ScrollDirection.IDLE;
          isShowHeader.value = firstVisibleIndex < 3 || lastVisibleIndex < 3;
        } else if (currentOffset < _previousScrollOffset.value) {
          _isHeaderInit.value = true;
          _scrollDirection.value = ScrollDirection.UP;
          isShowHeader.value = false;
        } else {
          debounceDelay(() {
            isShowHeader.value =
                _scrollDirection.value == ScrollDirection.DOWN ||
                    _isHeaderInit.value.isFalse();
          });
        }

        _previousScrollOffset.value = currentOffset;
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    _scrollDirection.listen((scroll) {
      print('scroll direction = ${scroll}');
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

enum ScrollDirection { UP, DOWN, IDLE }
