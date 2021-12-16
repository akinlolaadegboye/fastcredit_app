import 'package:fast_credit/core/services/auth_service.dart';
import 'package:get_it/get_it.dart';


// This injects service to app and make it available through the app
GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => Authentication());
}

