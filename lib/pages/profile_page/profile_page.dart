// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/profile.dart';
import 'package:sweep/states/profile_provider.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール"),
        centerTitle: true,
      ),
      body: profile == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: profile.photoURL.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(profile.photoURL),
                            radius: 30,
                          )
                        : const Icon(Icons.person, size: 60),
                    title: Text(
                      profile.displayName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.badge),
                    title: const Text('UID'),
                    subtitle: Text(profile.uid),
                  ),
                  ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: const Text('保有ポイント'),
                    subtitle: Text('${profile.point} ポイント'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('連続ログイン日数'),
                    subtitle: Text('${profile.continuousCount} 日'),
                  ),
                ],
              ),
            ),
    );
  }
}
