import 'package:flutter/material.dart';
import 'package:random_meal_generator/global/constants/strings.dart';
import 'package:random_meal_generator/models/Meal.dart';
import 'package:random_meal_generator/screens/meal_details_screen.dart';
import 'package:random_meal_generator/screens/meal_list_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MEAL_SCREEN:
        return BouncyPageRouteBuilder(
          screen: MealListScreen(),
        );
      case DETAILS_SCREEN:
        return BouncyPageRouteBuilder(
          screen: MealDetails(meal: args as Meal),
        );
      default:
        return _errorRoute();
    }
  }

//errors such as 404
  static Route<dynamic> _errorRoute() {
    return BouncyPageRouteBuilder(
      screen: MealListScreen(),
    );
  }
}

class BouncyPageRouteBuilder extends PageRouteBuilder {
  final Widget screen;
  BouncyPageRouteBuilder({required this.screen})
      : super(
          transitionDuration: Duration(milliseconds: 800),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondAnimation,
              Widget child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation,
          ) {
            return screen;
          },
        );
}
