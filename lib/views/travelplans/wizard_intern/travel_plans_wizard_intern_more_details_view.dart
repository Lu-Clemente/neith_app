import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neith/services/travelplan.dart';
import 'package:neith/utils/number.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/inputs/neith_text_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardInternMoreDetailsView extends StatefulWidget {
  const TravelPlansWizardInternMoreDetailsView(
      {super.key, required this.handleWizardState, required this.wizardState});

  final void Function(Map<String, dynamic> value) handleWizardState;
  final Map<String, dynamic> wizardState;

  @override
  State<TravelPlansWizardInternMoreDetailsView> createState() =>
      _TravelPlansWizardInternMoreDetailsViewState();
}

class _TravelPlansWizardInternMoreDetailsViewState
    extends State<TravelPlansWizardInternMoreDetailsView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _peopleCountController = TextEditingController();
  final _daysController = TextEditingController();
  final _arrivalTimeController = TextEditingController();
  final _departureTimeController = TextEditingController();
  final TimeOfDay _selectedTimeArrival = const TimeOfDay(hour: 0, minute: 0);
  final TimeOfDay _selectedTimeDeparture = const TimeOfDay(hour: 0, minute: 0);

  _handleWizardNext(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      widget.handleWizardState({
        "name": _nameController.text,
        "travelerCount": int.parse(_peopleCountController.text),
        "travelDuration": int.parse(_daysController.text),
        "arrivalHour":
            DateFormat('kk a').parse(_arrivalTimeController.text).hour,
        "departureHour":
            DateFormat('kk a').parse(_departureTimeController.text).hour
      });

      final res = await createTravelPlan(
          widget.wizardState['name'],
          'morning',
          widget.wizardState['tourismTypes'],
          widget.wizardState['travelerCount'],
          widget.wizardState['travelDuration'],
          widget.wizardState['arrivalHour'],
          widget.wizardState['departureHour']);

      if (context.mounted && res.id!.isNotEmpty) {
        widget.wizardState.clear();
        widget.handleWizardState({"createdId": res.id});
        Wizard.of(context).next();
      }
    }
  }

  _handleWizardBack(BuildContext context) {
    widget.handleWizardState({
      "name": _nameController.text,
      "travelerCount": int.tryParse(_peopleCountController.text) ?? 0,
      "travelDuration": int.tryParse(_daysController.text) ?? 0,
      "arrivalHour": DateFormat('kk a').parse(_arrivalTimeController.text).hour,
      "departureHour":
          DateFormat('kk a').parse(_departureTimeController.text).hour
    });
    Wizard.of(context).back();
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
  void initState() {
    super.initState();
    int arrivalTimeValue = widget.wizardState.containsKey('arrivalHour')
        ? widget.wizardState['arrivalHour'] + 1
        : 0;

    int departureTimeValue = widget.wizardState.containsKey('departureHour')
        ? widget.wizardState['departureHour'] + 1
        : 0;

    _nameController.value = TextEditingValue(
        text: widget.wizardState.containsKey('name')
            ? widget.wizardState['name']
            : '');
    _peopleCountController.value = TextEditingValue(
        text: widget.wizardState.containsKey('travelerCount')
            ? widget.wizardState['travelerCount'].toString()
            : '');
    _daysController.value = TextEditingValue(
        text: widget.wizardState.containsKey('travelDuration')
            ? widget.wizardState['travelDuration'].toString()
            : '');
    _arrivalTimeController.value = TextEditingValue(
        text: DateFormat('h a')
            .format(DateTime.parse(
                DateFormat('H').parse(arrivalTimeValue.toString()).toString()))
            .toString());

    _departureTimeController.value = TextEditingValue(
        text: DateFormat('h a')
            .format(DateTime.parse(DateFormat('H')
                .parse(departureTimeValue.toString())
                .toString()))
            .toString());
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
                          controller: _nameController,
                          textInputType: TextInputType.text,
                          labelText: 'Travel plan name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
