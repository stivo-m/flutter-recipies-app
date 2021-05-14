import 'package:dio/dio.dart';
import 'package:random_meal_generator/global/constants/strings.dart';
import 'package:random_meal_generator/models/Meal.dart';
import 'package:random_meal_generator/services/meals/base.dart';

class MealService implements BaseMealService {
  final Dio _dio = Dio();
//   var unirest = require("unirest");

// var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"start": "0",
// 	"limit": "18",
// 	"tag": "list.recipe.popular"
// });

// req.headers({
// 	"x-rapidapi-key": "2a2152e0f0mshe91b1199d939a95p1b2368jsn08841834b4b9",
// 	"x-rapidapi-host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
// });

  MealService() {
    // initialize dio and pass the headers
    _dio.options.headers['x-rapidapi-key'] =
        '2a2152e0f0mshe91b1199d939a95p1b2368jsn08841834b4b9';
    _dio.options.headers['x-rapidapi-host'] = 'yummly2.p.rapidapi.com';
    _dio.options.headers['useQueryString'] = 'true';
  }

  @override
  Future<List<Meal>> fetchMeals() async {
    List<Meal> _meals;
    var response = await _dio.get(
      API_ENDPOINT,
      queryParameters: {
        "start": "0",
        "limit": "18",
        "tag": "list.recipe.popular"
      },
    );

    _meals = Meal.mealsFromSnapshot(
      response.data['feed'],
    );
    return _meals;
  }
}

MealService mealService = MealService();
