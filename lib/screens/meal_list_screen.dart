import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_meal_generator/global/constants/strings.dart';
import 'package:random_meal_generator/redux/app_redux.dart';
import 'package:random_meal_generator/widgets/meal_card_widget.dart';

class MealListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
        centerTitle: true,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        // onInit: (store) => store.dispatch(FetchMeals()),
        builder: (BuildContext context, AppState state) {
          print("LOADING: ... " + state.loading.toString());
          if (state.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!state.loading && state.meals.length == 0) {
            return Center(
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    Text("No meals found at the moment"),
                    ElevatedButton(
                      onPressed: () {
                        print("----------------------------");
                        print(
                            "dispatch of the fetch meals action is initialized");
                        StoreProvider.of<AppState>(context)
                            .dispatch(FetchMeals());
                      },
                      child: Text('Fetch Meals'),
                    )
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.meals.length,
            itemBuilder: (BuildContext context, int index) {
              return MealCard(
                meal: state.meals[index],
              );
            },
          );
        },
      ),
    );
  }
}
