import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_text_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardInternMoreDetailsView extends StatelessWidget {
  TravelPlansWizardInternMoreDetailsView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _peopleCountController = TextEditingController();
  final _daysController = TextEditingController();
  final _arrivalTimeController = TextEditingController();
  final _departureTimeController = TextEditingController();

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
                  'More details',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Provide additional details about your trip, including daily schedule and number of travelers:',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        NeithTextField(
                            controller: _peopleCountController,
                            labelText: 'How many are coming people with you?'),
                        const SizedBox(
                          height: 10,
                        ),
                        NeithTextField(
                            controller: _daysController,
                            labelText: 'How many days of travel?'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              child: NeithTextField(
                                  controller: _arrivalTimeController,
                                  labelText: 'Arrival time'),
                            ),
                            SizedBox(
                              width: 170,
                              child: NeithTextField(
                                  controller: _departureTimeController,
                                  labelText: 'Departure time'),
                            )
                          ],
                        )
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
