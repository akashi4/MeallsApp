import 'package:flutter/material.dart';
import 'package:mealsApp/models/meal.dart';

import '../dummy-data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = "/category_meals_screen";
  //final String title;
  //final String id;

  //CategoryMealsScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
//getting arguments from the context
    final categoryId = routeArgs["id"];
    print(categoryId);
    final categoryTitle = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
            title: Text(
          categoryTitle,
        )),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
              imageUrl: categoryMeal[index].imageUrl,
              title: categoryMeal[index].title,
              id: categoryMeal[index].id,
            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
