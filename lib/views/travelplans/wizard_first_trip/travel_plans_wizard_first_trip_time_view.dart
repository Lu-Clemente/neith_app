import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:neith/widgets/lists/preferred_time_card_list_item.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripTimeView extends StatefulWidget {
  const TravelPlansWizardFirstTripTimeView(
      {super.key, required this.handleWizardState, required this.wizardState});

  final void Function(Map<String, dynamic> value) handleWizardState;
  final Map<String, dynamic> wizardState;

  @override
  State<StatefulWidget> createState() =>
      TravelPlansWizardFirstTripTimeViewState();
}

class TravelPlansWizardFirstTripTimeViewState
    extends State<TravelPlansWizardFirstTripTimeView> {
  List<String> selectedItems = [];

  _handleWizardNext(BuildContext context) {
    Wizard.of(context).next();
    widget.handleWizardState({"preferredTime": selectedItems});
  }

  _handleWizardBack(BuildContext context) {
    Wizard.of(context).back();
    widget.handleWizardState({"preferredTime": selectedItems});
  }

  @override
  void initState() {
    super.initState();
    debugPrint(widget.wizardState.values.toString());
    selectedItems = widget.wizardState.containsKey('preferredTime')
        ? widget.wizardState['preferredTime']
        : [];
    debugPrint(selectedItems.toString());
  }

  void _toggleItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
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
                Column(
                  children: [
                    PreferredTimeCardListItem(
                        onPressed: () => _toggleItem('morning'),
                        isSelected: selectedItems.contains('morning'),
                        icon: Icons.brightness_high,
                        title: 'Morning'),
                    PreferredTimeCardListItem(
                        onPressed: () => _toggleItem('afternoon'),
                        isSelected: selectedItems.contains('afternoon'),
                        icon: Icons.brightness_medium,
                        title: 'Afternoon'),
                    PreferredTimeCardListItem(
                        onPressed: () => _toggleItem('night'),
                        isSelected: selectedItems.contains('night'),
                        icon: Icons.brightness_2,
                        title: 'Night'),
                  ],
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
