// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';
import 'package:sweep/states/filter_provider.dart';
import 'package:sweep/states/get_posts_provider.dart';
import 'package:sweep/states/get_users_provider.dart';

class FilterBlock extends HookConsumerWidget {
  const FilterBlock({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(filterProvider);
    final filterOptions = [
      PostType.trash,
      PostType.trashCan,
      PostType.trashBox
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: filterOptions.map((value) {
          final isSelected = selectedFilters.contains(value);
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: FilterChip(
              label: Text(value.displayName),
              selected: isSelected,
              onSelected: (selected) {
                final newSelectedFilters = Set<PostType>.from(selectedFilters);
                if (selected) {
                  newSelectedFilters.add(value);
                } else {
                  newSelectedFilters.remove(value);
                }
                ref.read(filterProvider.notifier).state = newSelectedFilters;
                ref.read(getPostsProvider.notifier).filterPosts(ref);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
