import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:neith/widgets/lists/preferred_time_card_list_item.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardInternTimeView extends StatefulWidget {
  const TravelPlansWizardInternTimeView({super.key});

  @override
  State<StatefulWidget> createState() => TravelPlansWizardInternTimeViewState();
}

class TravelPlansWizardInternTimeViewState
    extends State<TravelPlansWizardInternTimeView> {
  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
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
