import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_multi_select_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripInterestsView extends StatelessWidget {
  const TravelPlansWizardFirstTripInterestsView({super.key});

  _handleWizardNext(BuildContext context) {
    Wizard.of(context).next();
  }

  void onChanged(List<String> value) {}

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const NeithAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Are you interested in:',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: NeithMultiSelectField(items: const [
                    'Adventure',
                    'EcoTourism',
                    'Gastronomic',
                    'Local Culture',
                    'Religious',
                    'Shopping'
                  ], onChanged: onChanged),
                ),
                const SizedBox(
                  height: 20,
                ),
                NeithTextButton(
                    onPressed: () => _handleWizardNext(context),
                    label: 'Continue'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
