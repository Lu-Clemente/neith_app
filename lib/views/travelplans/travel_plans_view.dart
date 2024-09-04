import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neith/services/travelplan.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:neith/widgets/lists/travel_plan_card_list_item.dart';

class TravelPlansView extends StatefulWidget {
  const TravelPlansView({super.key});

  @override
  State<StatefulWidget> createState() => _TravelPlansState();
}

class _TravelPlansState extends State<TravelPlansView> {
  late Future<Iterable<TravelPlan>> getTravelplan;
  late Future<List<TravelPlan>> fakePlans;

  handleCreateTravelPlan() {
    debugPrint('create new travel plan');
    Navigator.pushNamed(context, '/wizard');
  }

  handleTravelPlanDetailsClick({required String name}) {
    Navigator.pushNamed(context, '/details', arguments: {
      'travelPlan': name,
    });
  }

  sendTravelPlanToDetailsView({required TravelPlan travelPlan}) {
    Navigator.pushNamed(context, '/details', arguments: {
      'travelPlan': travelPlan,
    });
  }

  Future<List<TravelPlan>> loadTravelPlans() async {
    // Load JSON data from the assets
    final jsonString =
        await rootBundle.loadString('assets/travel_plan_data.json');

    // Decode JSON data
    final List<dynamic> jsonResponse = json.decode(jsonString);

    // Convert to List<TravelPlan>
    return jsonResponse.map((json) => TravelPlan.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getTravelplan = getTravelPlans();
    fakePlans = loadTravelPlans();
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
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: fakePlans,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Started',
                          style: TextStyle(
                              color: Color.fromRGBO(31, 27, 89, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: snapshot.data!.map((el) {
                            if (el.startDate != null && el.endDate == null) {
                              return TravelPlanCardListItem(
                                  onPressed: () => sendTravelPlanToDetailsView(
                                        travelPlan: el,
                                      ),
                                  name: el.name,
                                  description: el.tourismTypes.join(', '),
                                  photoUrl:
                                      'https://storage.googleapis.com/neith-app-project-places-photos-bucket-production/places/fMPxg1duYpVFXHzbcux7/ede99dc9-70d6-474f-a45a-9696054d16be.jpg?GoogleAccessId=neith-app-project%40appspot.gserviceaccount.com&Expires=1723513875&Signature=HjndSgbZofGC6CD%2FtciNFcs3f8PMCQJgLx23MG8h6FokQdzxUrNcwWQAuyMxUEuZI4b0uyj50JUIFwJw7V3Y8IcDuItxq5Hau9V6%2FaAgsYQVNAz7NOgUC8Br8MGbAXPrH5jH4jB6o5I3bAhEX7Xjuvp05Pb5LIxWAq0DyBBRUz%2FPdU4byGmbmhdX4X%2BvIHOFSLLdZ6y%2FVUAaW%2FmPmzc6%2B9my4wGxeFIeR9RQlyWjt80d2er1Qk%2BHEsNTzyxin4xpg10SmR%2B0%2Bsy3J9tk7dWkO7C7LiB%2FnplytCbaaQ8sk1vDkNN%2FbIxq2ruICJU9xbsYEnwrvItOt2T1L8mP8Nr0xA%3D%3D');
                            } else {
                              return const SizedBox(
                                width: 0,
                              );
                            }
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
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
                        Column(
                          children: snapshot.data!.map((el) {
                            if (el.startDate == null) {
                              return TravelPlanCardListItem(
                                  onPressed: () => sendTravelPlanToDetailsView(
                                        travelPlan: el,
                                      ),
                                  name: el.name,
                                  description: el.tourismTypes.join(', '),
                                  photoUrl:
                                      'https://storage.googleapis.com/neith-app-project-places-photos-bucket-production/places/fMPxg1duYpVFXHzbcux7/ede99dc9-70d6-474f-a45a-9696054d16be.jpg?GoogleAccessId=neith-app-project%40appspot.gserviceaccount.com&Expires=1723513875&Signature=HjndSgbZofGC6CD%2FtciNFcs3f8PMCQJgLx23MG8h6FokQdzxUrNcwWQAuyMxUEuZI4b0uyj50JUIFwJw7V3Y8IcDuItxq5Hau9V6%2FaAgsYQVNAz7NOgUC8Br8MGbAXPrH5jH4jB6o5I3bAhEX7Xjuvp05Pb5LIxWAq0DyBBRUz%2FPdU4byGmbmhdX4X%2BvIHOFSLLdZ6y%2FVUAaW%2FmPmzc6%2B9my4wGxeFIeR9RQlyWjt80d2er1Qk%2BHEsNTzyxin4xpg10SmR%2B0%2Bsy3J9tk7dWkO7C7LiB%2FnplytCbaaQ8sk1vDkNN%2FbIxq2ruICJU9xbsYEnwrvItOt2T1L8mP8Nr0xA%3D%3D');
                            } else {
                              return const SizedBox(
                                width: 0,
                              );
                            }
                          }).toList(),
                        ),
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
                        Column(
                          children: snapshot.data!.map((el) {
                            if (el.endDate != null) {
                              return TravelPlanCardListItem(
                                  onPressed: () => handleTravelPlanDetailsClick(
                                        name: el.name,
                                      ),
                                  name: el.name,
                                  description: el.tourismTypes.join(', '),
                                  photoUrl:
                                      'https://storage.googleapis.com/neith-app-project-places-photos-bucket-production/places/fMPxg1duYpVFXHzbcux7/ede99dc9-70d6-474f-a45a-9696054d16be.jpg?GoogleAccessId=neith-app-project%40appspot.gserviceaccount.com&Expires=1723513875&Signature=HjndSgbZofGC6CD%2FtciNFcs3f8PMCQJgLx23MG8h6FokQdzxUrNcwWQAuyMxUEuZI4b0uyj50JUIFwJw7V3Y8IcDuItxq5Hau9V6%2FaAgsYQVNAz7NOgUC8Br8MGbAXPrH5jH4jB6o5I3bAhEX7Xjuvp05Pb5LIxWAq0DyBBRUz%2FPdU4byGmbmhdX4X%2BvIHOFSLLdZ6y%2FVUAaW%2FmPmzc6%2B9my4wGxeFIeR9RQlyWjt80d2er1Qk%2BHEsNTzyxin4xpg10SmR%2B0%2Bsy3J9tk7dWkO7C7LiB%2FnplytCbaaQ8sk1vDkNN%2FbIxq2ruICJU9xbsYEnwrvItOt2T1L8mP8Nr0xA%3D%3D');
                            } else {
                              return const SizedBox(
                                width: 0,
                              );
                            }
                          }).toList(),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox(width: 0);
                  }
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                );
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
