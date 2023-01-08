import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function? _saveFilters;
  final Map<String, bool> _filters;
  FilterScreen(this._filters, this._saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget._filters['gluten']!;
    _vegan = widget._filters['vegan']!;
    _vegetarian = widget._filters['vegetarian']!;
    _lactoseFree = widget._filters['lactose']!;
    // TODO: implement initState
    super.initState();
  }

  Widget buildSettings(String title, Function(bool) change, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: change,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  };
                  widget._saveFilters!(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: Drawer(child: MainDrawer()),
        body: Column(
          children: [
            Container(
                child: Text(
                  "Adjust your meal selection",
                  style: Theme.of(context).textTheme.headline6,
                ),
                padding: EdgeInsets.all(20)),
            Expanded(
              child: ListView(
                children: [
                  buildSettings("Gluten free", (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }, _glutenFree),
                  buildSettings("Lactose free", (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }, _lactoseFree),
                  buildSettings("Vegetarian", (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }, _vegetarian),
                  buildSettings("Vegan", (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }, _vegan),
                ],
              ),
            )
          ],
        ));
  }
}
