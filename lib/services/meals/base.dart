import 'package:random_meal_generator/models/Meal.dart';

abstract class BaseMealService {
  Future<List<Meal>> fetchMeals();
}
