import 'package:core/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:main/presentation/bindings/main_binding.dart';
import 'package:main/presentation/views/main_view.dart';

class AppPages {
  AppPages._();

  static const initialRoute = Routes.main;

  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
