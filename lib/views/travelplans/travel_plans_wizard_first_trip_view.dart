import 'package:flutter/material.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_generate_travel_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_interests_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_more_details_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_more_info_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_search_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_time_view.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripView extends StatelessWidget {
  const TravelPlansWizardFirstTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wizard(
        routes: {
          '/more-info': WizardRoute(
              builder: (bla) => TravelPlansWizardFirstTripMoreInfoView(
                  parentContext: context)),
          '/search': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardFirstTripSearchView()),
          '/interests': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardFirstTripInterestsView()),
          '/time': WizardRoute(
              builder: (context) => const TravelPlansWizardFirstTripTimeView()),
          '/more-details': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardFirstTripMoreDetailsView()),
          '/generate': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardFirstTripGenerateTravelView()),
        },
      ),
    );
  }
}
