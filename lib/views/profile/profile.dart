import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:neith/views/auth/login_view.dart';
import 'package:neith/views/auth/reset_password_view.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/layout.dart';

class ProfileView extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileView({Key? key}) : super(key: key);

  Future<void> _signOut(context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign out failed: $e')),
      );
    }
  }

  void _goToResetPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => _goToResetPassword(context),
              child: const Text('Account'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Display'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Notifications'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Preferences'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => _signOut(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
