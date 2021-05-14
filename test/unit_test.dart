import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  group("Tests for fetching meals from the API", () {
    test("When called, should return a List of Meals", () {
      MockMealService mealService = MockMealService();
      mealService.fetchMeals();
    });
  });
}
