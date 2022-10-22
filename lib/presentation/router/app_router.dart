import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

import '../screens/help/help_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/otp/otp_screen.dart';
import '../screens/product overview/product_overview_screen.dart';
import '../screens/shared screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginScreen = '/login';
  static const String otpScreen = '/otp';
  static const String homeScreen = '/homeScreen';
  static const String productOverviewScreen = '/productOverviewScreen';
  static const String helpScreen = '/helpScreen';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    ///this condition to deal with arguments as Map<String, dynamic>
    Map<String, dynamic>? routeArguments;
    if (settings.arguments != null) {
      routeArguments = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:

        ///this condition to do the normal navigation when logout and the animated navigation when login
        if (CacheHelper.getDataFromSharedPreference(key: 'isLoggedIn') !=
            null) {
          return SlideAnimatedRoute(
              builder: (context) => LoginScreen(), settings: settings);
        } else {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }

      case Routes.otpScreen:
        return SlideAnimatedRoute(
            builder: (context) => OtpScreen(
                  otpCode: routeArguments!['otpCode'],
                  phone: routeArguments['phone'],
                ),
            settings: settings);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case Routes.productOverviewScreen:
        return MaterialPageRoute(
            builder: (_) => ProductOverviewScreen(
                  productModel: ProductModel.fromJson(routeArguments!),
                ));
      default:
        return null;
    }
  }
}

class SlideAnimatedRoute<T> extends MaterialPageRoute<T> {
  SlideAnimatedRoute(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(animation),
        child: child);
  }
}
