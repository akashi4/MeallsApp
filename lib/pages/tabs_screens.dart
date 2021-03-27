import 'package:flutter/material.dart';
import './categories_screens.dart';
import './favorites.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Categories",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "Favorites",
                icon: Icon(Icons.star),
              )
            ],
          ),
        ),
        body: TabBarView(children: [CategoryScreens(), Favorites()]),
      ),
      length: 2,
    );
  }
}
