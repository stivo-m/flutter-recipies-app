import 'package:mockito/mockito.dart';
import 'package:random_meal_generator/models/Meal.dart';
import 'package:random_meal_generator/services/meals/base.dart';

class MockMealService extends Mock implements BaseMealService {
  Future<List<Meal>> fetchMeals() async {
    return Future.delayed(
      Duration(seconds: 3),
      () => [
        Meal(
          id: "test id",
          title: "test title",
          category: "test category",
          thumbnail: "test thumbnail",
          tags: "test tag",
          video: "test video",
          description: "test description",
          rating: "2.0",
          totalTime: "test totaltime 10 min",
          preparationSteps: ['test step 1', 'test step 2'],
        )
      ],
    );
  }
}
