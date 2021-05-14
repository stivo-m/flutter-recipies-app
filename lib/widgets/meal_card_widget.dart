import 'package:flutter/material.dart';
import 'package:random_meal_generator/models/Meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          )
        ],
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(meal.thumbnail),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Text(
                meal.title,
                style: TextStyle(
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
