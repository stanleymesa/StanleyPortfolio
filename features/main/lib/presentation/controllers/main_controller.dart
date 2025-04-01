import 'dart:async';

import 'package:core/database/app_persistence.dart';
import 'package:core/di/locator.dart';
import 'package:core/utils/ext.dart';
import 'package:get/get.dart';
import 'package:main/model/nav_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainController extends GetxController {
  final AppPersistence appPersistence = locator.get<AppPersistence>();
  final ItemScrollController scrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  Timer? timer;

  final navItems = [
    NavItem(navType: NavType.HOME, title: 'Home', isSelected: true),
    NavItem(navType: NavType.ABOUT, title: 'About', isSelected: false),
    NavItem(navType: NavType.PROJECTS, title: 'Projects', isSelected: false),
    NavItem(navType: NavType.JOURNEY, title: 'Journey', isSelected: false),
  ].obs;

  final _previousScrollOffset = 0.0.obs;
  final _isHeaderInit = false.obs;
  final _isScrolling = false.obs;
  final _scrollDirection = ScrollDirection.IDLE.obs;
  final isShowHeader = true.obs;

  void debounceDelay(Function() action, {int delay = 100}) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: delay), action);
  }

  void scrollTo(NavType navType) {
    final index = navItems.indexWhere((e) => e.navType == navType);
    scrollController.scrollTo(
        index: index != -1 ? index : 0, duration: Duration(milliseconds: 500));

    _isScrolling.value = true;
    navItems.value =
        navItems.map((e) => e.copy(isSelected: e.navType == navType)).toList();
    debounceDelay(() => _isScrolling.value = false, delay: 1000);
  }

  @override
  void onInit() {
    itemPositionsListener.itemPositions.addListener(() {
      final currentPositions = itemPositionsListener.itemPositions.value;

      if (currentPositions.isNotEmpty && _isScrolling.value.isFalse()) {
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
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

enum ScrollDirection { UP, DOWN, IDLE }
