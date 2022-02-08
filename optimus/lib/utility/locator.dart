import 'package:get_it/get_it.dart';
import 'package:optimus/service/navigation_service.dart';
import 'package:optimus/utility/api_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => ApiProvider());
}