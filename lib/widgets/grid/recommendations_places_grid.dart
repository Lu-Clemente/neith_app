import 'package:flutter/material.dart';

class RecommendationsPlacesGrid extends StatelessWidget {
  const RecommendationsPlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 1,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, int index) {
          return SizedBox(
            height: 200,
            child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                    onTap: () => {debugPrint("show place details")},
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const ClipRect(
                          child: Image(
                            image: AssetImage('assets/recommendationplace.png'),
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                        const Text(
                          'Rome',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ))),
          );
        });
  }
}
