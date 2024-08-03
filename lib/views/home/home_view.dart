import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neith/utils/time.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  void initState() {
    super.initState();
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
      body: Center(
        child: Text(
          'Welcome dear user, ${_getUser()}!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
