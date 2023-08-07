import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_step.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite = ref.watch(favoriteMealsProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(ref
                        .read(favoriteMealsProvider.notifier)
                        .toggleMealFavoriteStatus(meal)
                    ? 'Meal added as favorite'
                    : 'Meal removed'),
              ),
            );
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              // return RotationTransition(
              //   turns: Tween<double>(
              //     begin: 0.8,
              //     end: 1,
              //   ).animate(animation),
              //   child: child,
              // );
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1.0,
                ).animate(animation),
                child: child,
              );
            },
            child: Icon(
              isFavorite ? Icons.star : Icons.star_outline,
              key: ValueKey(isFavorite),
            ),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView(children: [
          Image(
            image: NetworkImage(meal.imageUrl),
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 14),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 14),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          const SizedBox(height: 24),
          Text('Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  )),
          ...meal.steps.asMap().entries.map((step) {
            return MealStep(i: step.key.toString(), text: step.value);
          }),
        ]),
      ),
    );
  }
}
