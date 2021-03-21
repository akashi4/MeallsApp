import 'dart:ui';

import 'package:flutter/material.dart';
import './categories_screens.dart';
import './categories_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              headline6: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CategoryScreens(),
      routes: {
        'category_meals_screen': (ctx) => CategoryMealsScreen()
      }, // pages routes parameters
    );
  }
}
