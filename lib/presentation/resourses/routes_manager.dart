import 'package:driver_app/presentation/resourses/strings_manager.dart';
import 'package:driver_app/screens/login/login_screen.dart';
import 'package:driver_app/screens/splash_screen/splashScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBordingRoute = "/onboarding";
  static const String loginhRoute = "/login";
  static const String RegisterRoute = "/register";
  static const String mainRoute = "/main";
  static const String fogetPassword = "/forgetPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBordingRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginhRoute:
      case Routes.RegisterRoute:
      case Routes.fogetPassword:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound),
        ),
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
