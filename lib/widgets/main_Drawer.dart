import 'package:flutter/material.dart';
import '../pages/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function tabHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RoboCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tabHandler,
      );
    }

    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text("Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor)),
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('settings', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ],
    );
  }
}
