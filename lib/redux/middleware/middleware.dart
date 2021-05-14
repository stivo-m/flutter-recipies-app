import 'package:random_meal_generator/redux/app_redux.dart';
import 'package:random_meal_generator/services/meals/meal_service.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action is FetchMeals) {
    try {
      mealService.fetchMeals().then((_meals) {
        store.dispatch(MealsFetched(_meals));
      });
    } catch (e) {
      store.dispatch(MealsFetched([]));
    }
  }
  next(action);
}
