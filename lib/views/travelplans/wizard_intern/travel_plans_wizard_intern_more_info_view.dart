import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_select_field.dart';
import 'package:neith/widgets/inputs/neith_switcher.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardInternMoreInfoView extends StatelessWidget {
  final BuildContext parentContext;
  final bool showAppBar = true;
  final _formKey = GlobalKey<FormState>();
  final void Function(Map<String, dynamic> value) handleWizardState;

  final SwitchController _mobilityRestrictionsController = SwitchController(
    false,
  );
  final DropdownController _dietaryRestrictionsController = DropdownController(
    'None',
  );
  final DropdownController _disabilitiesController = DropdownController(
    'None',
  );

  TravelPlansWizardInternMoreInfoView(
      {super.key,
      required this.parentContext,
      required this.handleWizardState});

  _handleWizardNext(BuildContext context) {
    handleWizardState({
      "tourismTypes": {
        'mobilityRestrictions': _mobilityRestrictionsController.value,
        'dietaryRestrictions': _dietaryRestrictionsController.value,
        'disabilities': _disabilitiesController.value
      }
    });

    Wizard.of(context).next();
  }

  _handleWizardBack() {
    Navigator.of(parentContext).popAndPushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dietaryItems = [
      'Vegetarianism',
      'Veganism',
      'Ovo-Lacto Vegetarianism',
      'Lactose Intolerance',
      'Gluten Inrolerance',
      'None',
    ];

    final List<String> disabilityItems = [
      'Mobility',
      'Hearing',
      'Vision',
      'Cognitive',
      'None',
    ];

    return Layout(
      appBar: showAppBar
          ? NeithAppBar(
              onBackButtonPressed: () => _handleWizardBack(),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(
                    height: 192, image: AssetImage('assets/wizard-flow-1.png')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Neith!',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'To ensure your trip is smooth and comfortable, we need some information:',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        NeithSwitchField(
                          controller: _mobilityRestrictionsController,
                          labelText: 'Do you have mobility restrictions?',
                        ),
                        NeithSelectField(
                          items: dietaryItems,
                          controller: _dietaryRestrictionsController,
                          hintText: 'Select your dietary restrictions',
                          labelText: 'Do you have any dietary restrictions?',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        NeithSelectField(
                          items: disabilityItems,
                          controller: _disabilitiesController,
                          hintText: 'Select your disabilities',
                          labelText: 'Do you have any disabilities?',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
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
