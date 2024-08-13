import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardMoreInfoView extends StatelessWidget {
  final BuildContext parentContext;
  const TravelPlansWizardMoreInfoView({super.key, required this.parentContext});

  _handleWizardNext(BuildContext context) {
    Wizard.of(context).next();
  }

  _handleWizardBack() {
    Navigator.of(parentContext).popAndPushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: NeithAppBar(
        onBackButtonPressed: () => _handleWizardBack(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'More information View',
                style: TextStyle(
                    color: Color.fromRGBO(31, 27, 89, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              NeithTextButton(
                  onPressed: () => _handleWizardBack(), label: 'Back'),
              NeithTextButton(
                  onPressed: () => _handleWizardNext(context), label: 'Next')
            ],
          )
        ],
      ),
    );
  }
}
