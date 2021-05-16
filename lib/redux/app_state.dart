import 'package:random_meal_generator/models/Meal.dart';

class AppState {
  final List<Meal> meals;
  final bool loading;
  final int start;
  final int limit;

  AppState({
    required this.meals,
    required this.loading,
    required this.start,
    required this.limit,
  });

  AppState.initialState()
      : this.meals = [],
        this.loading = false,
        this.start = 0,
        this.limit = 20;

  AppState.copyWith({
    required AppState state,
    required List<Meal> meals,
    required bool loading,
    required int limit,
    required int start,
  })   : this.meals = meals.length > 0 ? meals : state.meals,
        this.loading = loading,
        this.start = start,
        this.limit = limit;
}
