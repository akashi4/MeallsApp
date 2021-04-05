import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoritesMeals;
  Favorites(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text("The Favorites meals"),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: favoritesMeals[index].affordability,
            complexity: favoritesMeals[index].complexity,
            duration: favoritesMeals[index].duration,
            imageUrl: favoritesMeals[index].imageUrl,
            title: favoritesMeals[index].title,
            id: favoritesMeals[index].id,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
