import 'package:random_meal_generator/redux/actions/actions.dart';
import 'package:random_meal_generator/redux/app_state.dart';

AppState appReducer(AppState prevState, dynamic action) {
  if (action is FetchMeals) {
    return AppState.copyWith(
      state: prevState,
      loading: true,
      meals: [],
      start: 0,
      limit: 20,
    );
  }
  if (action is MealsFetched) {
    return AppState.copyWith(
      state: prevState,
      loading: false,
      meals: action.meals,
      limit: action.limit,
      start: action.limit,
    );
  }

  return AppState.copyWith(
    state: prevState,
    meals: prevState.meals,
    loading: false,
    start: prevState.start,
    limit: prevState.limit,
  );
}
