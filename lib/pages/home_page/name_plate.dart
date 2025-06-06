// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// Project imports:
import 'package:sweep/classes/profile.dart';
import 'package:sweep/pages/profile_page/profile_page.dart';
import 'package:sweep/scripts/firebase_update_script.dart';
import 'package:sweep/states/analytics_provider.dart';
import 'package:sweep/states/login_notifier.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/states/tasks_provider.dart';
import 'package:sweep/widgets/point_dialog.dart';

class NamePlate extends HookConsumerWidget {
  const NamePlate({super.key});

  // Future<void> fireFunctionLogin(WidgetRef ref) async {
  //   Future.delayed(Duration(seconds: 1));
  //   try {
  //     await FirebaseFunctions.instance.httpsCallable("userLogin").call(
  //       {
  //         "uid": ref.watch(profileProvider)?.uid,
  //       },
  //     );
  //   } on FirebaseFunctionsException catch (error) {
  //     debugPrint(error.code);
  //     debugPrint("むりぽ");
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Profile profile = ref.watch(profileProvider);

    final analytics = ref.watch(analyticsProvider);

    // useEffect(() {
    //   if (profile?.uid != "") {
    //     fireFunctionLogin(profile!);
    //   }
    // }, [profile?.uid]);

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
            child: InkWell(
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }),
                );
              },
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
          ),
        ],
      ),
    );
  }
}
