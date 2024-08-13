import 'package:flutter/material.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:neith/widgets/lists/travel_plan_card_list_item.dart';

class TravelPlansView extends StatefulWidget {
  const TravelPlansView({super.key});

  @override
  State<StatefulWidget> createState() => _TravelPlansState();
}

class _TravelPlansState extends State<TravelPlansView> {
  handleCreateTravelPlan() {
    debugPrint('create new travel plan');
    Navigator.pushNamed(context, '/wizard');
  }

  handleTravelPlanDetailsClick() {
    debugPrint('see travel plan details');
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Travel plans',
            style: TextStyle(
                color: Color.fromRGBO(31, 27, 89, 1),
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 36,
          ),
          NeithTextButton(
              onPressed: () => handleCreateTravelPlan(),
              label: 'Create new travel plan'),
          const SizedBox(
            height: 36,
          ),
          const Text(
            'Not started',
            style: TextStyle(
                color: Color.fromRGBO(31, 27, 89, 1),
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          TravelPlanCardListItem(
              onPressed: handleTravelPlanDetailsClick,
              name: 'Rome',
              shortFormattedAddress: 'Italy',
              photoUrl:
                  'https://media.discordapp.net/attachments/1261097433073586285/1271981131214094346/App_Icon_1.png?ex=66b9503d&is=66b7febd&hm=28b6a4b37c3c84360885a72ddb25d44b603637fa676ac4066612dd2d6a521575&=&format=webp&quality=lossless'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Finished',
            style: TextStyle(
                color: Color.fromRGBO(31, 27, 89, 1),
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          TravelPlanCardListItem(
              onPressed: handleTravelPlanDetailsClick,
              name: 'Rome',
              shortFormattedAddress: 'Italy',
              photoUrl:
                  'https://media.discordapp.net/attachments/1261097433073586285/1271981131214094346/App_Icon_1.png?ex=66b9503d&is=66b7febd&hm=28b6a4b37c3c84360885a72ddb25d44b603637fa676ac4066612dd2d6a521575&=&format=webp&quality=lossless'),
        ],
      ),
    ));
  }
}
