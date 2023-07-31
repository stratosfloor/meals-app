import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/filter_item.dart';
import 'package:meals_app/provider/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            filter: Filter.glutenFree,
            title: 'Gluten-free',
            value: activeFilters[Filter.glutenFree]!,
          ),
          FilterItem(
            filter: Filter.lactoseFree,
            title: 'Lacto-free',
            value: activeFilters[Filter.lactoseFree]!,
          ),
          FilterItem(
            filter: Filter.vegetarian,
            title: 'Vegetarian',
            value: activeFilters[Filter.vegetarian]!,
          ),
          FilterItem(
            filter: Filter.vegan,
            title: 'Vegan',
            value: activeFilters[Filter.vegan]!,
          ),
        ],
      ),
    );
  }
}
