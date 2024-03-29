import 'dart:ui';

import 'package:flutter/material.dart';

import './dummy-data.dart';
import './pages/filtersScreen.dart';
import './pages/tabs_screens.dart';
import './pages/categories_meals_screen.dart';
import './pages/meal_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluteen": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _setfilters(Map<String, bool> filterData) {
    _filters = filterData;

    setState(() {
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluteen'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.route: (ctx) => CategoryMealsScreen(availableMeals),
        MealScreen.route: (ctx) => MealScreen(toggleFavorite, isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setfilters),
      }, // pages routes parameters
    );
  }
}
