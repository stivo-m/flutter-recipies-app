import 'package:random_meal_generator/redux/actions/actions.dart';
import 'package:random_meal_generator/redux/app_state.dart';

AppState appReducer(AppState prevState, dynamic action) {
  if (action is FetchMeals) {
    return AppState.copyWith(prevState, []);
  } else if (action is MealsFetched) {
    return AppState.copyWith(prevState, action.meals);
  } else {
    return AppState.copyWith(prevState, prevState.meals);
  }
}
