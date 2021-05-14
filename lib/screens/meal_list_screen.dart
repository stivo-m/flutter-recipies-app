import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_meal_generator/redux/app_redux.dart';

class MealListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (BuildContext context, state) => ListView.builder(
          itemCount: state.meals.length,
          itemBuilder: (BuildContext context, int index) => Container(),
        ),
      ),
    );
  }
}
