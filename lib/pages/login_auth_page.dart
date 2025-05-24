import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/pages/main_page.dart';
import 'package:sweep/states/profile_provider.dart';

class VerificationCodePage extends HookConsumerWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = useTextEditingController();
    final isLoading = useState(false);

    Future<void> verifyCode() async {
      isLoading.value = true;

      ref
          .read(profileProvider.notifier)
          .verifyCodePhoneNumber(codeController.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );

      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('二段階認証'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              '確認コードを入力してください',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: '確認コード',
                border: OutlineInputBorder(),
                counterText: '', // Hide the default counter
              ),
              keyboardType: TextInputType.number,
              maxLength: 6, // Assuming a 6-digit code
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20.0, letterSpacing: 8.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'コードを入力してください';
                }
                if (value.length != 6) {
                  return '6桁のコードを入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: isLoading.value ? null : verifyCode,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: isLoading.value
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text('確認', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
