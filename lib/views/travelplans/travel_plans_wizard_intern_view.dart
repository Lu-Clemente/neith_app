import 'package:flutter/material.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_generate_travel_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_interests_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_more_details_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_search_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_time_view.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardInternView extends StatefulWidget {
  final BuildContext grandfathercontext;
  const TravelPlansWizardInternView(
      {super.key, required this.grandfathercontext});

  @override
  State<TravelPlansWizardInternView> createState() =>
      TravelPlansWizardInternViewState();
}

class TravelPlansWizardInternViewState
    extends State<TravelPlansWizardInternView> {
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
          '/search': WizardRoute(
              builder: (bla) => TravelPlansWizardInternSearchView(
                    parentContext: context,
                    handleWizardState: handleWizardState,
                  )),
          '/interests': WizardRoute(
              builder: (context) => TravelPlansWizardInternInterestsView(
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/time': WizardRoute(
              builder: (context) => TravelPlansWizardInternTimeView(
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/more-details': WizardRoute(
              builder: (context) => TravelPlansWizardInternMoreDetailsView(
                    handleWizardState: handleWizardState,
                    wizardState: wizardState,
                  )),
          '/generate': WizardRoute(
              builder: (context) => TravelPlansWizardInternGenerateTravelView(
                    parentContext: widget.grandfathercontext,
                    wizardState: wizardState,
                  )),
        },
      ),
    );
  }
}
