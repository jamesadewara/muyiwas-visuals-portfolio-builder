import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/services/auth_service.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset('assets/images/google_logo.png'),
          onPressed: () {
            Provider.of<AuthService>(context, listen: false).signInWithGoogle();
          },
        ),
      ],
    );
  }
}