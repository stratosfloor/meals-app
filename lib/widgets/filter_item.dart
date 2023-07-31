import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.value,
    required this.toggle,
  });

  final String title;
  final bool value;
  final void Function() toggle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (val) {
        toggle();
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        'Only include ${title.toLowerCase()} meals',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
