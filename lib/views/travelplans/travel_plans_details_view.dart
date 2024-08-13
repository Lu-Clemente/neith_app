import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/carousel/travel_days_carousel.dart';
import 'package:neith/widgets/grid/neith_separator.dart';
import 'package:neith/widgets/layout.dart';

class ScreenArguments {
  final String name;
  final String travelDuration;

  ScreenArguments({
    required this.name,
    required this.travelDuration,
  });
}

class TravelPlansDetailsView extends StatelessWidget {
  const TravelPlansDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;

    print(args?['name']);
    print(args?['travelDuration']);

    return Layout(
      appBar: const NeithAppBar(
        title: 'Welcome ... !',
        actions: [NeithAppBarAction.notifications],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NeithTextButton(onPressed: () {}, label: 'Start travel'),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 50,
            child: TravelDaysCarousel(
              days: [
                'Day 1',
                'Day 2',
                'Day 3',
                'Day 4',
                'Day 5',
                'Day 6',
                'Day 7',
                'Day 8'
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const NeithSeparator(
                  label: 'Morning',
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                  5,
                  (index) => Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Fontana di Trevi ${index + 1}'),
                            subtitle: Text(
                              'Restaurant - Italian ${index + 1}',
                            ),
                          ),
                        ),
                        ActionChip(
                          avatar: const Icon(Icons.schedule),
                          label: const Text('45 min'),
                          onPressed: () {},
                          shape: const StadiumBorder(),
                          labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ),
                ),
                const NeithSeparator(
                  label: 'Afternoon',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
