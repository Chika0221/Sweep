// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

// Project imports:
import 'package:sweep/pages/login_page/login_auth_page.dart';
import 'package:sweep/pages/login_page/sign_button.dart';
import 'package:sweep/pages/main_page.dart';
import 'package:sweep/states/login_notifier.dart';

//ログインのページ
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberController = useState(TextEditingController(
      text: "+81",
    ));

    Future<void> goNextPage() async {
      await Navigator.of(context).pushReplacement(
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.tertiaryContainer,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Theme.of(context).colorScheme.surface),
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 8,
                  children: [
                    Spacer(),
                    TextField(
                        controller: phoneNumberController.value,
                        decoration: InputDecoration(
                          hintText: "電話番号",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          ref
                              .read(loginProvider.notifier)
                              .signInWithPhoneNumber(
                                context,
                                phoneNumberController.value.text,
                              );
                          goAuthPage();
                        },
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
                        await ref
                            .read(loginProvider.notifier)
                            .signInWithGoogle();
                        goNextPage();
                      },
                      type: ButtonType.google,
                    ),
                    SignButton(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Appleの年間1万のサブスク必須むずいです"),
                          ),
                        );
                      },
                      type: ButtonType.apple,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
