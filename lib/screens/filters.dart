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
  var _glutenFreeFilterSet = false;

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
            subTitle: 'Only include gluten-free meals.',
            status: _glutenFreeFilterSet,
            toggle: () {
              setState(() {
                _glutenFreeFilterSet = !_glutenFreeFilterSet;
              });
            },
          )
        ],
      ),
    );
  }
}
