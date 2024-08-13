import 'package:flutter/material.dart';
import 'package:neith/views/travelplans/wizard/travel_plans_wizard_generate_travel_view.dart';
import 'package:neith/views/travelplans/wizard/travel_plans_wizard_interests_view.dart';
import 'package:neith/views/travelplans/wizard/travel_plans_wizard_more_details_view.dart';
import 'package:neith/views/travelplans/wizard/travel_plans_wizard_more_info_view.dart';
import 'package:neith/views/travelplans/wizard/travel_plans_wizard_search_view.dart';
import 'package:neith/views/travelplans/wizard/travel_plans_wizard_time_view.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardView extends StatelessWidget {
  const TravelPlansWizardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wizard(
        routes: {
          '/more-info': WizardRoute(
              builder: (bla) =>
                  TravelPlansWizardMoreInfoView(parentContext: context)),
          '/search': WizardRoute(
              builder: (context) => const TravelPlansWizardSearchView()),
          '/interests': WizardRoute(
              builder: (context) => const TravelPlansWizardInterestsView()),
          '/time':
              WizardRoute(builder: (context) => TravelPlansWizardTimeView()),
          '/more-details': WizardRoute(
              builder: (context) => TravelPlansWizardMoreDetailsView()),
          '/generate': WizardRoute(
              builder: (context) =>
                  const TravelPlansWizardGenerateTravelView()),
        },
      ),
    );
  }
}
