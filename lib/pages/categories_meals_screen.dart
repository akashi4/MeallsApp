import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = "/category_meals_screen";
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  bool firstLoad = false;

  @override
  void didChangeDependencies() {
    if (!firstLoad) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      //getting arguments from the context
      final categoryId = routeArgs["id"];
      categoryTitle = routeArgs['title'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      firstLoad = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          categoryTitle,
        )),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: displayedMeal[index].affordability,
              complexity: displayedMeal[index].complexity,
              duration: displayedMeal[index].duration,
              imageUrl: displayedMeal[index].imageUrl,
              title: displayedMeal[index].title,
              id: displayedMeal[index].id,
            );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
