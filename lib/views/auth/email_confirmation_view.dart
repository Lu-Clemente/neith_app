// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';

class EmailConfirmationView extends StatefulWidget {
  final User user;

  const EmailConfirmationView({super.key, required this.user});

  @override
  EmailConfirmationViewState createState() => EmailConfirmationViewState();
}

class EmailConfirmationViewState extends State<EmailConfirmationView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? _timer;
  bool isVerified = false;
  bool emailSent = false;

  Future<void> _sendEmailVerification() async {
    widget.user.sendEmailVerification();
    emailSent = true;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification email sent')),
    );
  }

  Future<bool> _checkEmailVerified() async {
    await widget.user.reload();
    if (widget.user.emailVerified) {
      return true;
    }
    return false;
  }

  _handleEmailVerification() async {
    bool isVerified = await _checkEmailVerified();
    if (isVerified) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/wizard', (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email not verified')),
      );
    }
  }

  void _navigateToHome() {
    _timer?.cancel(); // Stop the timer once the user is verified
    Navigator.pushNamedAndRemoveUntil(
        context, '/wizard', (Route<dynamic> route) => false);
  }

  void _startVerificationCheck() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.reload();
        user = _auth.currentUser;
        if (user != null && user.emailVerified) {
          setState(() {
            isVerified = true;
          });
          _navigateToHome();
        } else {
          if (!emailSent) _sendEmailVerification();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const NeithAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Email confirmation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'A verification email has been sent to your email address.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 40),
              NeithTextButton(
                onPressed: _sendEmailVerification,
                label: 'Resend verification email',
              ),
              const SizedBox(height: 20),
              NeithTextButton(
                onPressed: _handleEmailVerification,
                label: 'I have verified my email',
                variant: NeithTextButtonVariant.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
