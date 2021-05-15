import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_meal_generator/global/constants/strings.dart';
import 'package:random_meal_generator/models/Meal.dart';
import 'package:random_meal_generator/redux/app_redux.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;

  const MealDetails({
    Key? key,
    required this.meal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(meal.video?['videoUrls']['android']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.0),
                        BlendMode.multiply,
                      ),
                      image: NetworkImage(meal.thumbnail),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[400],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            meal.rating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.alarm_sharp,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            meal.totalTime.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  meal.description?['mobileSectionName'],
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  meal.description?['text'].toString() ?? "No description",
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 2.0,
                  ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  PREPARATION_STEPS_TEXT,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Text(
                  meal.preparationSteps.join(),
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 2.0,
                  ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
