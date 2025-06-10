// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// Project imports:
import 'package:sweep/main.dart';
import 'package:sweep/pages/login_page/login_auth_page.dart';
import 'package:sweep/pages/login_page/sign_button.dart';
import 'package:sweep/pages/main_page.dart';
import 'package:sweep/states/login_notifier.dart';

//ログインのページ
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> goNextPage() async {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }

    Future<void> goAuthPage() async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerificationCodePage(),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(
                    "assets/icons/icon_android_foreground.png",
                  ),
                ),
                Text(
                  "みんなで一緒にきれいな街を目指しましょう",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
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
          Expanded(
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Spacer(),
                        // TextField(
                        //     controller: phoneNumberController.value,
                        //     decoration: InputDecoration(
                        //       hintText: "電話番号",
                        //       border: OutlineInputBorder(),
                        //     ),
                        //     keyboardType: TextInputType.phone),
                        // Spacer(),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: FilledButton(
                        //     onPressed: () {
                        //       ref
                        //           .read(loginProvider.notifier)
                        //           .signInWithPhoneNumber(
                        //             context,
                        //             phoneNumberController.value.text,
                        //           );
                        //       goAuthPage();
                        //     },
                        //     child: Text("ログイン"),
                        //   ),
                        // ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: Text("アカウント作成"),
                        // ),
                        SignButton(
                          onTap: () async {
                            await ref
                                .read(loginProvider.notifier)
                                .signInWithGoogle();
                            // goNextPage();
                          },
                          type: ButtonType.google,
                        ),
                        if (Platform.isIOS) ...[
                          SizedBox(
                            height: 16,
                          ),
                          SignButton(
                            onTap: () async {
                              await ref
                                  .read(loginProvider.notifier)
                                  .signInWithApple();
                              // goNextPage();
                            },
                            type: ButtonType.apple,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
