import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/sign_button.dart';

class SignButton extends HookConsumerWidget {
  const SignButton({
    super.key,
    required this.onTap,
    required this.type,
  });

  final void Function() onTap;
  final ButtonType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInButton(
      elevation: 1,
      btnText: "${type.name}でサインイン",
      buttonType: type,
      onPressed: onTap,
    );
  }
}
