import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_select_field.dart';
import 'package:neith/widgets/inputs/neith_switcher.dart';
import 'package:neith/widgets/layout.dart';

class MoreInformation extends StatefulWidget {
  const MoreInformation({Key? key}) : super(key: key);

  @override
  State<MoreInformation> createState() => _MoreInformationState();
}

class _MoreInformationState extends State<MoreInformation> {
  final _formKey = GlobalKey<FormState>();

  final SwitchController _mobilityRestrictionsController = SwitchController(
    false,
  );
  final DropdownController _dietaryRestrictionsController = DropdownController(
    'None',
  );
  final DropdownController _disabilitiesController = DropdownController(
    'None',
  );

  void _goToNextPage() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, '/first-trip/transportation');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> dietaryItems = [
      'Vegetarianism',
      'Veganism',
      'Ovo-Lacto Vegetarianism',
      'Lactose Intolerance',
      'Gluten Inrolerance',
      'None',
    ];

    List<String> disabilityItems = [
      'Mobility',
      'Hearing',
      'Vision',
      'Cognitive',
      'None',
    ];

    return Layout(
      appBar: const NeithAppBar(
        showBackButton: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome to Neith!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Enter your email below to receive instructions to reset your password.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                NeithSwitchField(
                  controller: _mobilityRestrictionsController,
                  labelText: 'Do you have mobility restrictions?',
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 40),
                NeithTextButton(
                  onPressed: _goToNextPage,
                  label: 'Continue',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
