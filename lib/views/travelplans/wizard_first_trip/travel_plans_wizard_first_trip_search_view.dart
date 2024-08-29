import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/inputs/neith_search_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:neith/widgets/lists/travel_plan_card_list_item.dart';
import 'package:wizard_router/wizard_router.dart';

class TravelPlansWizardFirstTripSearchView extends StatefulWidget {
  const TravelPlansWizardFirstTripSearchView({super.key});

  @override
  State<StatefulWidget> createState() =>
      TravelPlansWizardFirstTripSearchViewState();
}

class TravelPlansWizardFirstTripSearchViewState
    extends State<TravelPlansWizardFirstTripSearchView> {
  Map<String, dynamic> something = {};
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _handleSearchPlaceSubmit(String value) {}

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
                  'Where we go first?',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                NeithSearchField(
                  controller: _searchController,
                  onFieldSubmitted: _handleSearchPlaceSubmit,
                  readOnly: true,
                ),
                const SizedBox(height: 40),
                TravelPlanCardListItem(
                    onPressed: () => _handleWizardNext(context),
                    name: 'Rome',
                    description: 'Italy',
                    photoUrl:
                        'https://storage.googleapis.com/neith-app-project-places-photos-bucket-production/places/fMPxg1duYpVFXHzbcux7/ede99dc9-70d6-474f-a45a-9696054d16be.jpg?GoogleAccessId=neith-app-project%40appspot.gserviceaccount.com&Expires=1723526649&Signature=m3L7odjQzasVlVoeRqEQLH4yTc%2BUzXTOfk9WnSoezyRETUiFbS%2FT9H5ch8aznkiQ01j0CioAdCAItbm8amVe3gpIVIKJ6qINwPl2Ox%2FM6d1VnG7S5qUW0m%2BYIrbbriaRForefEyVsmoBC6HDKG4r5A%2F5YovL4nSfHLKUWa5sHBy%2FzH8NzkP%2B5PL36zzfP4sT27Zp%2FqkzSZvD0DoC0JBITUbQf6PhkvPVbTJMUqoKDIp131rLu9OU1wlN48QkLY0HEUVHBDxT6pKZuLJcnYWqinpDpV65IbcumH4M53iqsE3R%2B2HCSAiQp2M3MQsL5bBON%2FnD7XGZNb92s1vYjW%2FAyg%3D%3D'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
