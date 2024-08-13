import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardTimeView extends StatelessWidget {
  TravelPlansWizardTimeView({super.key});

  _handleWizardNext(BuildContext context) {
    Wizard.of(context).next();
  }

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
                  'What time you want?',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select your preferred times to see the things and everything',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
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
