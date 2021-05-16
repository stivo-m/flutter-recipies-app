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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_rounded),
            SizedBox(
              width: 10.5,
            ),
            Text(APP_TITLE),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: StoreBuilder<AppState>(
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
                          Text(NO_MEALS_FOUND_TEXT),
                          ElevatedButton(
                            onPressed: () {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(FetchMeals());
                            },
                            child: Text(GET_MEAL_TEXT),
                          )
                        ],
                      ),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => StoreProvider.of<AppState>(context)
                      .dispatch(FetchMeals()),
                  child: ListView.builder(
                    itemCount: store.state.meals.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == store.state.meals.length - 1) {
                        return Container(
                          height: 280,
                          child: Column(
                            children: [
                              MealCard(
                                meal: store.state.meals[index],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton.icon(
                                onPressed: () =>
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(FetchMeals()),
                                icon: Icon(Icons.arrow_circle_down),
                                label: Text('Fetch more recipies'),
                              )
                            ],
                          ),
                        );
                      } else {
                        return MealCard(
                          meal: store.state.meals[index],
                        );
                      }
                    },
                  ),
                );
              }
            }),
      ),
    );
  }
}
