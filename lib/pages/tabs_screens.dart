import 'package:flutter/material.dart';

import '../widgets/main_Drawer.dart';
import './categories_screens.dart';
import './favorites.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {"page": CategoryScreens(), "title": "Categories"},
      {"page": Favorites(widget.favoritesMeals), "title": "Favorites"}
    ];
    super.initState();
  }

  int selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedIndex]["title"]),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).accentColor,
        //unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites")
        ],
      ),
    );
  }
}
