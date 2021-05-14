import 'package:flutter/material.dart';
import 'package:random_meal_generator/global/constants/strings.dart';
import 'package:random_meal_generator/screens/meal_list_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MEAL_SCREEN:
        return MaterialPageRoute(
          builder: (context) => MealListScreen(),
        );
      default:
        return errorRoute();
    }
  }

//errors such as 404
  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) => MealListScreen(),
    );
  }
}
