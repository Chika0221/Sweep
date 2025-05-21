import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:sweep/pages/main_page.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/widgets/sign_button.dart';

//ログインのページ
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> goNextPage() async {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 8,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "メールアドレス",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "パスワード",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text("ログイン"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("アカウント作成"),
                  ),
                  Spacer(),
                  Divider(),
                  SignButton(
                    onTap: () async {
                      await ref.read(profileProvider.notifier).signInWithGoogle();
                      goNextPage();
                    },
                    type: ButtonType.google,
                  ),
                  SignButton(
                    onTap: () {},
                    type: ButtonType.apple,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
