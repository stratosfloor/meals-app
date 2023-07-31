import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currectFilters,
  });

  final Map<Filter, bool> currectFilters;

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
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currectFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currectFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currectFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currectFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
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
      ),
    );
  }
}
