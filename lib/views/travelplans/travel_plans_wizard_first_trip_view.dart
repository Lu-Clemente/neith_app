import 'package:flutter/material.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_generate_travel_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_interests_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_more_details_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_more_info_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_search_view.dart';
import 'package:neith/views/travelplans/wizard_first_trip/travel_plans_wizard_first_trip_time_view.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripView extends StatefulWidget {
  final BuildContext grandfathercontext;
  const TravelPlansWizardFirstTripView(
      {super.key, required this.grandfathercontext});

  @override
  State<TravelPlansWizardFirstTripView> createState() =>
      TravelPlansWizardFirstTripViewState();
}

class TravelPlansWizardFirstTripViewState
    extends State<TravelPlansWizardFirstTripView> {
  final Map<String, dynamic> wizardState = {};

  void handleWizardState(Map<String, dynamic> value) {
    setState(() {
      wizardState.addAll(value);
      debugPrint(wizardState.keys.toString());
      debugPrint(wizardState.values.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wizard(
        routes: {
          '/more-info': WizardRoute(
              builder: (bla) => TravelPlansWizardFirstTripMoreInfoView(
                    parentContext: context,
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/search': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardFirstTripSearchView()),
          '/interests': WizardRoute(
              builder: (context) => TravelPlansWizardFirstTripInterestsView(
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/time': WizardRoute(
              builder: (context) => TravelPlansWizardFirstTripTimeView(
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/more-details': WizardRoute(
              builder: (context) => TravelPlansWizardFirstTripMoreDetailsView(
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/generate': WizardRoute(
              builder: (context) =>
                  TravelPlansWizardFirstTripGenerateTravelView(
                    parentContext: widget.grandfathercontext,
                    wizardState: wizardState,
                  )),
        },
      ),
    );
  }
}
