import 'package:random_meal_generator/redux/app_redux.dart';
import 'package:random_meal_generator/services/meals/meal_service.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action is FetchMeals) {
    try {
      mealService
          .fetchMeals(
        store.state.start,
        store.state.limit,
      )
          .then((_meals) {
        // next limit should add 20 items.
        // this means the store.state.start should be 0
        // and store.state.limit = store.state.start + 20;
        store.dispatch(MealsFetched(
          _meals,
          store.state.limit,
          store.state.limit + 20,
        ));
      });
    } catch (e) {
      store.dispatch(MealsFetched([], 0, 20));
    }
  }
  next(action);
}
