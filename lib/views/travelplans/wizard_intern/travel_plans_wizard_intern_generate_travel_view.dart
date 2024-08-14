import 'package:flutter/material.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';

class TravelPlansWizardInternGenerateTravelView extends StatefulWidget {
  const TravelPlansWizardInternGenerateTravelView({super.key});

  @override
  State<StatefulWidget> createState() =>
      TravelPlansWizardInternGenerateTravelViewState();
}

class TravelPlansWizardInternGenerateTravelViewState
    extends State<TravelPlansWizardInternGenerateTravelView> {
  bool isLoading = true;
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
                  const Text(
                    'Generating your travel plan...',
                    style: TextStyle(
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
                          onPressed: () => {}, label: 'Let\'s start!')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
