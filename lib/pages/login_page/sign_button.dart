// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
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
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: SignInButton(
        elevation: 0,
        btnText: "${type.name}でサインイン",
        buttonType: type,
        onPressed: onTap,
        btnColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        btnTextColor: Theme.of(context).colorScheme.onSurface,
        buttonSize: ButtonSize.medium,
      ),
    );
  }
}
