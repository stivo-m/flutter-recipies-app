import 'package:random_meal_generator/models/Meal.dart';
import 'package:random_meal_generator/services/meals/base.dart';

class MealService implements BaseMealService {
  @override
  Future<List<Meal>> fetchMeals() async {
    List<Meal> meals = [];
    return meals;
  }
}

MealService mealService = MealService();
