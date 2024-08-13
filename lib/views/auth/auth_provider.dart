import 'package:flutter/material.dart';
import '../../services/auth.dart';

class AuthProvider extends InheritedWidget {
  final AuthService auth;
  const AuthProvider({
    super.key,
    required Widget child,
    required this.auth,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AuthProvider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<AuthProvider>());
}
