import 'package:random_meal_generator/models/Meal.dart';

class AppState {
  final List<Meal> meals;
  final bool loading;

  AppState({
    required this.meals,
    required this.loading,
  });

  AppState.initialState()
      : this.meals = [],
        this.loading = false;

  AppState.copyWith({
    required AppState state,
    required List<Meal> meals,
    required bool loading,
  })   : this.meals = meals.length > 0 ? meals : state.meals,
        this.loading = loading;
}
