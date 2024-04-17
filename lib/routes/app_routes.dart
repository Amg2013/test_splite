import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/sign_in_screen/sign_in_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';

class AppRoutes {
  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String profilePage = '/profile_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        signInScreen: SignInScreen.builder,
        signUpScreen: SignUpScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SignInScreen.builder
      };
}
