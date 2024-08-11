import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neith/utils/time.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/carousel/recent_travel_plans_carousel.dart';
import 'package:neith/widgets/grid/recommendations_places_grid.dart';
import 'package:neith/widgets/layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String token = '';

  String _getUser() {
    final user = _auth.currentUser;
    return user?.displayName ?? 'dear user';
  }

  Future<void> _getUserToken() async {
    final user = _auth.currentUser;
    final userToken = await user?.getIdToken();
    setState(() {
      token = userToken!.toString();
    });
    debugPrint('User Token: $userToken');
  }

  /*  Future<void> _registerUserName() async {
    final user = _auth.currentUser;
    if (user?.displayName == null) {
      await user?.updateDisplayName('Lu Clemente');
    }
  } */

  _startTravelPlan() {
    debugPrint('starting travel plan');
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
            NeithAppBarAction.notifications,
          ],
          showBackButton: false,
          title: 'Welcome, ${_getUser()}!',
          subtitle: 'Today, ${getTodayDate()}',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recent travel plans',
                style: TextStyle(
                    color: Color.fromRGBO(31, 27, 89, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 350,
                child: RecentTravelPlansCarousel(
                  startTravelPlan: _startTravelPlan,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Some places for you',
                style: TextStyle(
                    color: Color.fromRGBO(31, 27, 89, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 200, child: RecommendationsPlacesGrid()),
              TextButton(
                  onPressed: () => _getUserToken(),
                  child: const Text('Get token')),
              Text(token)
            ],
          ),
        ));
  }
}
