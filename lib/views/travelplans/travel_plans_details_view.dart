import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neith/services/travelplan.dart';
import 'package:neith/utils/time.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/cards/travel_detail_card.dart';
import 'package:neith/widgets/carousel/travel_days_carousel.dart';
import 'package:neith/widgets/grid/neith_separator.dart';
import 'package:neith/widgets/layout.dart';

class TravelPlansDetailsView extends StatefulWidget {
  const TravelPlansDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  State<TravelPlansDetailsView> createState() => _TravelPlansDetailsViewState();
}

class _TravelPlansDetailsViewState extends State<TravelPlansDetailsView> {
  int selectedDay = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userName = '';

  void _getUser() {
    _auth.userChanges().listen((User? user) {
      setState(() {
        userName = user == null ? '' : user.displayName.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final travelPlan = args?['travelPlan'] as TravelPlan?;

    final plans = travelPlan?.plan ?? {};
    final days = plans['days'] as List<dynamic>? ?? [];

    List<dynamic> getSchedulebyDay({required int day}) {
      return days[day]['schedule'];
    }

    List<dynamic> getRestaurantsbyDay({required int day}) {
      return days[day]['restaurants'];
    }

    return Layout(
      appBar: NeithAppBar(
        title: 'Welcome, $userName!',
        subtitle: 'Today, ${getTodayDate()}',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NeithTextButton(
              onPressed: () => startTravelPlan(travelPlan!.id),
              label: 'Start travel'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: TravelDaysCarousel(
              selectedDay: selectedDay,
              onPressed: (index) {
                setState(() {
                  selectedDay = index;
                });
              },
              days: List.generate(
                days.length,
                (index) => 'Day ${index + 1}',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const NeithSeparator(
            label: 'Activities',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                for (final schedule in getSchedulebyDay(day: selectedDay))
                  TravelDetailCard(
                    title: schedule['activity'],
                    subtitle: schedule['location'],
                    time: schedule['time'],
                  ),
                const NeithSeparator(
                  label: 'Restaurants',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Restaurants',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (final restaurant in getRestaurantsbyDay(day: selectedDay))
                  TravelDetailCard(
                    title: restaurant['activity'],
                    subtitle: restaurant['name'],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
