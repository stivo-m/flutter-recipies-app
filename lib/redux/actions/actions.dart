import 'package:random_meal_generator/models/Meal.dart';

abstract class Action {}

class FetchMeals extends Action {}

class MealsFetched extends Action {
  final List<Meal> meals;

  MealsFetched(this.meals);
}
