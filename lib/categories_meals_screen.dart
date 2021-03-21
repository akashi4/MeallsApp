import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String title;
  //final String id;

  //CategoryMealsScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
//getting arguments from the context
    final id = routeArgs["id"];
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
          title: Text(
        title,
      )),
      body: Container(
        child: Center(
            child: Text(
          'Category meals page',
          style: TextStyle(
            color: Colors.black,
          ),
        )),
      ),
    );
  }
}
