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
      body: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(FetchMeals()),
          builder: (BuildContext context, store) {
            {
              if (store.state.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (store.state.meals.length == 0) {
                return Center(
                  child: Container(
                    height: 200,
                    child: Column(
                      children: [
                        Text("No meals found at the moment"),
                        ElevatedButton(
                          onPressed: () {
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

              return RefreshIndicator(
                onRefresh: () =>
                    StoreProvider.of<AppState>(context).dispatch(FetchMeals()),
                child: ListView.builder(
                  itemCount: store.state.meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MealCard(
                      meal: store.state.meals[index],
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
