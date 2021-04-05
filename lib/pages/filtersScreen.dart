import 'package:flutter/material.dart';

import '../widgets/main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';
  final Function update;
  final Map<String, bool> currentScreen;
  FiltersScreen(this.currentScreen, this.update);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _gluteenFree = widget.currentScreen['gluteen'];
    _vegan = widget.currentScreen['vegan'];
    _vegeterian = widget.currentScreen['vegeterian'];
    _lactoseFree = widget.currentScreen['lactose'];

    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                "gluteen": _gluteenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegeterian,
              };
              widget.update(selectedFilters);
            },
          )
        ],
      ),
      drawer: Drawer(child: MainDrawer()),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Ajust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'GluteenFree', 'Only include gluteenFree meals', _gluteenFree,
                  (newValue) {
                setState(() {
                  _gluteenFree = newValue;
                });
              }),
              buildSwitchListTile('LactoseFree',
                  'Only include lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegeterian', 'Only include Vegeterian meals', _vegeterian,
                  (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              }),
              buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
