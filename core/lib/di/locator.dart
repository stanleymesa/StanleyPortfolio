import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/database/app_persistence.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUpLocator() {
  // Api Service
  locator.registerLazySingleton(() => Dio());
  // locator.registerLazySingleton(() => RemoteService());

  // App Persistance
  locator.registerLazySingleton<AppPersistence>(() => AppPersistence());

  // Else
  locator.registerLazySingleton(() => Connectivity());
}
