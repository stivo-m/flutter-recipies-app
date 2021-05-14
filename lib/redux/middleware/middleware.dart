import 'package:random_meal_generator/models/Meal.dart';
import 'package:random_meal_generator/redux/app_redux.dart';
import 'package:random_meal_generator/services/meals/meal_service.dart';
import 'package:redux/redux.dart';

Middleware<AppState> appMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is FetchMeals) {
      List<Meal> meals = await mealService.fetchMeals();
      print("----------------------------");
      print("Meals fetched was dispatched by middleware");

      store.dispatch(MealsFetched(meals));
    }
    next(action);
  };
}
