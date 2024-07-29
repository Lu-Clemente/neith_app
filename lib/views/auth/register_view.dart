// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:neith/views/auth/email_confirmation_view.dart';
import 'package:neith/widgets/buttons/neith_icon_button.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_text_field.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/layout.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final userCredentials = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EmailConfirmationView(user: userCredentials.user!),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Failed: ${e.message}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const NeithAppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Sign up with your email and password or use your Google or Meta account.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                NeithTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                NeithTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                NeithTextField(
                  controller: _passwordConfirmationController,
                  labelText: 'Confirm Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                NeithTextButton(
                  onPressed: _register,
                  label: 'Sign Up',
                ),
                const SizedBox(height: 10),
                NeithIconButton(
                  onPressed: () {},
                  iconPath: 'assets/google_icon.png',
                  label: 'Sign Up with Google',
                  textColor: Colors.black,
                  backgroundColor: const Color(0xFFF2F2F2),
                ),
                const SizedBox(height: 10),
                NeithIconButton(
                  onPressed: () {},
                  iconPath: 'assets/meta_icon.png',
                  label: 'Sign Up with Meta',
                  textColor: Colors.white,
                  backgroundColor: const Color(0xFF007EF7),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
