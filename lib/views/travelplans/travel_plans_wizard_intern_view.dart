import 'package:flutter/material.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_generate_travel_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_interests_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_more_details_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_search_view.dart';
import 'package:neith/views/travelplans/wizard_intern/travel_plans_wizard_intern_time_view.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardInternView extends StatelessWidget {
  const TravelPlansWizardInternView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wizard(
        routes: {
          '/search': WizardRoute(
              builder: (bla) => TravelPlansWizardInternSearchView(
                    parentContext: context,
                  )),
          '/interests': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardInternInterestsView()),
          '/time': WizardRoute(
              builder: (context) => const TravelPlansWizardInternTimeView()),
          '/more-details': WizardRoute(
              builder: (context) => TravelPlansWizardInternMoreDetailsView()),
          '/generate': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardInternGenerateTravelView()),
        },
      ),
    );
  }
}
