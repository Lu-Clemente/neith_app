import 'package:flutter/material.dart';
import 'package:neith/utils/number.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_text_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripMoreDetailsView extends StatefulWidget {
  const TravelPlansWizardFirstTripMoreDetailsView({super.key});

  @override
  State<TravelPlansWizardFirstTripMoreDetailsView> createState() =>
      _TravelPlansWizardFirstTripMoreDetailsViewState();
}

class _TravelPlansWizardFirstTripMoreDetailsViewState
    extends State<TravelPlansWizardFirstTripMoreDetailsView> {
  final _formKey = GlobalKey<FormState>();
  final _peopleCountController = TextEditingController();
  final _daysController = TextEditingController();
  final _arrivalTimeController = TextEditingController();
  final _departureTimeController = TextEditingController();
  final TimeOfDay _selectedTimeArrival = const TimeOfDay(hour: 0, minute: 0);
  final TimeOfDay _selectedTimeDeparture = const TimeOfDay(hour: 0, minute: 0);

  _handleWizardNext(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      Wizard.of(context).next();
    }
  }

  void _selectTime(BuildContext context, TextEditingController controller,
      TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        time = TimeOfDay(hour: picked.hour, minute: 0); // Ignora os minutos
      });
      controller.text =
          '${time.hourOfPeriod} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
    }
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
                          textInputType: TextInputType.number,
                          labelText: 'How many are coming people with you?',
                          validator: (value) {
                            if (value == null || !isNumeric(value)) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        NeithTextField(
                          controller: _daysController,
                          textInputType: TextInputType.number,
                          labelText: 'How many days of travel?',
                          validator: (value) {
                            if (value == null || !isNumeric(value)) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              child: NeithTextField(
                                  readOnly: true,
                                  onTap: () => _selectTime(
                                      context,
                                      _arrivalTimeController,
                                      _selectedTimeArrival),
                                  controller: _arrivalTimeController,
                                  labelText: 'Arrival time'),
                            ),
                            SizedBox(
                              width: 170,
                              child: NeithTextField(
                                  readOnly: true,
                                  onTap: () => _selectTime(
                                      context,
                                      _departureTimeController,
                                      _selectedTimeDeparture),
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
