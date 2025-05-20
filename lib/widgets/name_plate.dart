import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/states/user_provider.dart';

class NamePlate extends HookConsumerWidget {
  const NamePlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              padding: EdgeInsets.all(2),
              child: ClipOval(
                child: Image.network(
                  user.photoURL!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              user.displayName!,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
