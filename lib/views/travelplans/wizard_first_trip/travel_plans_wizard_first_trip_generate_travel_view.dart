import 'package:flutter/material.dart';
import 'package:neith/services/travelplan.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';

class TravelPlansWizardFirstTripGenerateTravelView extends StatefulWidget {
  const TravelPlansWizardFirstTripGenerateTravelView(
      {super.key, required this.wizardState, required this.parentContext});

  final BuildContext parentContext;
  final Map<String, dynamic> wizardState;

  @override
  State<StatefulWidget> createState() =>
      TravelPlansWizardFirstTripGenerateTravelViewState();
}

class TravelPlansWizardFirstTripGenerateTravelViewState
    extends State<TravelPlansWizardFirstTripGenerateTravelView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    handleGenerateTravelPlan();
  }

  handleGenerateTravelPlan() async {
    TravelPlan res = await generateTravelPlan(widget.wizardState['createdId']);

    if (context.mounted && res.name.isNotEmpty) {
      setState(() {
        isLoading = false;
      });
    }
  }

  handleFinishClick() {
    Navigator.of(widget.parentContext)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Layout(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Image(
                      height: 192,
                      image: AssetImage('assets/generating-travel-plan.png')),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    isLoading
                        ? 'Generating your travel plan...'
                        : 'Travel plan generated!',
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isLoading
                      ? const Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Packing your things...',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 40),
                          ],
                        )
                      : NeithTextButton(
                          onPressed: handleFinishClick, label: 'Let\'s start!')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
