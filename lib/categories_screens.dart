import 'package:flutter/material.dart';

import 'dummy-data.dart';
import 'category_item.dart';

class CategoryScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DeliMeal',
          //style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(
                  title: cat.title,
                  color: cat.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
