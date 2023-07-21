import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'No meals found',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                const SizedBox(height: 16),
                Text(
                  'Try selecting a differnt category!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, i) => MealItem(meal: meals[i]),
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
