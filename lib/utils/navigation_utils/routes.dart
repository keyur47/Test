import 'package:dht/modules/auth/sign_in/screen/sign_in_screen.dart';
import 'package:dht/modules/auth/sign_up/screen/sign_up_screen.dart';
import 'package:dht/modules/dashbord/home/screen/home_screen.dart';

import 'package:dht/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  // get started
  static const String splash = '/splash';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String home = '/home';

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signUpScreen,
      page: () => SignUpScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signInScreen,
      page: () => SignInScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: home,
      page: () => HomeScreen(),
      transition: defaultTransition,
    ),
  ];
}
