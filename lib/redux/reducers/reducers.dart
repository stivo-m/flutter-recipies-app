import 'package:random_meal_generator/redux/actions/actions.dart';
import 'package:random_meal_generator/redux/app_state.dart';

AppState appReducer(AppState prevState, dynamic action) {
  if (action is FetchMeals) {
    return AppState.copyWith(
      state: prevState,
      loading: true,
      meals: [],
    );
  }
  if (action is MealsFetched) {
    return AppState.copyWith(
      state: prevState,
      loading: false,
      meals: action.meals,
    );
  }

  return AppState.copyWith(
    state: prevState,
    meals: prevState.meals,
    loading: false,
  );
}
