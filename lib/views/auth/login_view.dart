// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:neith/views/auth/email_confirmation_view.dart';
import 'package:neith/views/auth/forget_password_view.dart';
import 'package:neith/widgets/buttons/neith_icon_button.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_text_field.dart';
import 'package:neith/views/auth/register_view.dart';
import 'package:neith/views/home_view.dart';
import 'package:neith/widgets/layout.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (mounted) {
          if (_auth.currentUser?.emailVerified == false) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EmailConfirmationView(user: _auth.currentUser!),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(),
              ),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Failed: ${e.message}')),
        );
      }
    }
  }

  _goToForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordView()),
    );
  }

  _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Image(
                    image: AssetImage('assets/logo.png'),
                    height: 104.94,
                    width: 93.38,
                  ),
                  const SizedBox(height: 46.6),
                  const Text('Login to your account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      )),
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
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    heightFactor: 1,
                    child: GestureDetector(
                      onTap: _goToForgetPassword,
                      child: const Text(
                        'Forgot your Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  NeithTextButton(
                    onPressed: _login,
                    label: 'Sign In',
                  ),
                  const SizedBox(height: 10),
                  NeithIconButton(
                    onPressed: () {},
                    iconPath: 'assets/google_icon.png',
                    label: 'Sign In with Google',
                    textColor: Colors.black,
                    backgroundColor: const Color(0xFFF2F2F2),
                  ),
                  const SizedBox(height: 10),
                  NeithIconButton(
                    onPressed: () {},
                    iconPath: 'assets/meta_icon.png',
                    label: 'Sign In with Meta',
                    textColor: Colors.white,
                    backgroundColor: const Color(0xFF007EF7),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(
                      color: Color(0xFF1F1B59),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _goToRegister,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
