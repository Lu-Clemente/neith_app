import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neith/utils/time.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/layout.dart';

class HomeView extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  HomeView({super.key});

  String _getUser() {
    final user = _auth.currentUser;
    return user?.displayName ?? 'dear user';
  }

  Future<void> _registerUserName() async {
    final user = _auth.currentUser;
    if (user?.displayName == null) {
      await user?.updateDisplayName('Lu Clemente');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: NeithAppBar(
        actions: const [
          NeithAppBarAction.profile,
          NeithAppBarAction.notifications,
        ],
        showBackButton: false,
        title: 'Welcome, ${_getUser()}!',
        subtitle: 'Today, ${getTodayDate()}',
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
