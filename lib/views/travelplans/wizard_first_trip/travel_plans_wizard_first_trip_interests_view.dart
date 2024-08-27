import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_multi_select_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripInterestsView extends StatefulWidget {
  const TravelPlansWizardFirstTripInterestsView(
      {super.key, required this.handleWizardState, required this.wizardState});

  final void Function(Map<String, dynamic> value) handleWizardState;
  final Map<String, dynamic> wizardState;

  @override
  State<TravelPlansWizardFirstTripInterestsView> createState() =>
      TravelPlansWizardFirstTripInterestsViewState();
}

class TravelPlansWizardFirstTripInterestsViewState
    extends State<TravelPlansWizardFirstTripInterestsView> {
  List<String> selectedItems = [];

  _handleWizardNext(BuildContext context) {
    Wizard.of(context).next();
    widget.handleWizardState({"tourismTypes": selectedItems});
  }

  _handleWizardBack(BuildContext context) {
    Wizard.of(context).back();
    widget.handleWizardState({"tourismTypes": selectedItems});
  }

  @override
  void initState() {
    super.initState();
    debugPrint(widget.wizardState.values.toString());
    selectedItems = widget.wizardState.containsKey('tourismTypes')
        ? widget.wizardState['tourismTypes']
        : [];
    debugPrint(selectedItems.toString());
  }

  void onChanged(List<String> value) {
    setState(() {
      selectedItems = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar:
          NeithAppBar(onBackButtonPressed: () => _handleWizardBack(context)),
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
                  child: NeithMultiSelectField(
                      items: const [
                        'Adventure',
                        'EcoTourism',
                        'Gastronomic',
                        'Local Culture',
                        'Religious',
                        'Shopping'
                      ],
                      externalSelectedItems: selectedItems,
                      onChanged: onChanged),
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
