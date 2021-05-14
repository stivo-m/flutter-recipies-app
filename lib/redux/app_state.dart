import 'package:random_meal_generator/models/Meal.dart';

class AppState {
  final List<Meal> meals;

  AppState(this.meals);

  AppState.initialState() : this.meals = [];

  AppState.copyWith(AppState state, List<Meal> meals)
      : this.meals = meals.length > 0 ? meals : state.meals;
}
