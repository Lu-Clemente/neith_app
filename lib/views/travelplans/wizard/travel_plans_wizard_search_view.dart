import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardSearchView extends StatelessWidget {
  const TravelPlansWizardSearchView({super.key});

  _handleWizardNext(BuildContext context) {
    Wizard.of(context).next();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const NeithAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Search View',
                style: TextStyle(
                    color: Color.fromRGBO(31, 27, 89, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              NeithTextButton(
                  onPressed: () => _handleWizardNext(context), label: 'Next')
            ],
          )
        ],
      ),
    );
  }
}
