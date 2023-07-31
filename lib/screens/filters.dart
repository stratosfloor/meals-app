import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            title: 'Gluten-free',
            value: _glutenFreeFilterSet,
            toggle: () {
              setState(() {
                _glutenFreeFilterSet = !_glutenFreeFilterSet;
              });
            },
          ),
          FilterItem(
            title: 'Lacto-free',
            value: _lactoseFreeFilterSet,
            toggle: () {
              setState(() {
                _lactoseFreeFilterSet = !_lactoseFreeFilterSet;
              });
            },
          ),
          FilterItem(
            title: 'Vegetarian',
            value: _vegetarianFilterSet,
            toggle: () {
              setState(() {
                _vegetarianFilterSet = !_vegetarianFilterSet;
              });
            },
          ),
          FilterItem(
            title: 'Vegan',
            value: _veganFilterSet,
            toggle: () {
              setState(() {
                _veganFilterSet = !_veganFilterSet;
              });
            },
          ),
        ],
      ),
    );
  }
}
