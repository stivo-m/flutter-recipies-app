import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_meal_generator/global/constants/strings.dart';
import 'package:random_meal_generator/global/router/router.dart';
import 'package:random_meal_generator/redux/app_redux.dart';
import 'package:random_meal_generator/redux/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [appMiddleware()],
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Meal List Screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MEAL_SCREEN,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
