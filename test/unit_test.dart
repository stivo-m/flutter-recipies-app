import 'package:flutter_test/flutter_test.dart';
import 'package:random_meal_generator/redux/app_redux.dart';
import 'package:redux/redux.dart';
import 'mocks.dart';

void main() {
  group("Tests for fetching meals from the API.", () {
    test("When called, should return a List of Meals", () async {
      MockMealService _mealService = MockMealService();
      var meals = await _mealService.fetchMeals(0, 20);

      expect(1, meals.length);
    });
  });
  group(
    "Redux Functionality",
    () {
      final Store<AppState> _store = Store<AppState>(
        appReducer,
        initialState: AppState.initialState(),
        middleware: [appStateMiddleware],
      );

      test(
        "If Get Meals Action is dispatched, store should be loading with an empty list",
        () async {
          await _store.dispatch(FetchMeals());

          expect([], _store.state.meals);
          expect(true, _store.state.loading);
        },
      );

      test(
        "If Meals Fetched Action is dispatched, store should not be loading and should have a list of meals",
        () async {
          MockMealService _mockMealService = MockMealService();
          var meals = await _mockMealService.fetchMeals(0, 20);
          await _store.dispatch(MealsFetched(meals, 0, 20));

          expect(1, _store.state.meals.length);
          expect(false, _store.state.loading);
        },
      );
    },
  );
}
