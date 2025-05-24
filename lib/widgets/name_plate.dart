import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/profile.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class NamePlate extends HookConsumerWidget {
  const NamePlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Profile? profile = ref.watch(profileProvider);

    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                Theme.of(context).colorScheme.primaryFixedDim,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
              ],
              durations: [
                4000,
                6000,
                5000,
              ],
              heightPercentages: [
                0.60,
                0.64,
                0.80,
              ],
            ),
            size: Size(double.infinity, 200),
            waveAmplitude: 0,
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    padding: EdgeInsets.all(2),
                    child: ClipOval(
                      child: Image.network(
                        profile!.photoURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.displayName,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        profile.uid,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
