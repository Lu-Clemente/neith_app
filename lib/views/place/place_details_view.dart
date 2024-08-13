import 'package:flutter/material.dart';
import 'package:neith/services/search.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';
import 'package:neith/widgets/layout.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailsView extends StatelessWidget {
  final SearchPlace place;

  const PlaceDetailsView({super.key, required this.place});

  Widget _generateTypesTag(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: place.types
              .map(
                (el) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Chip(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      padding: const EdgeInsets.all(2),
                      backgroundColor: Colors.indigo,
                      label: Text(
                        el.toString().replaceAll('_', ' '),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )),
              )
              .toList(),
        ),
      ),
    );
  }

  _handleGoToGoogleMaps(String urlMap) async {
    debugPrint(urlMap);
    if (await canLaunchUrl(Uri.parse('$urlMap&z=10'))) {
      await launchUrl(Uri.parse('$urlMap&z=10'));
    } else {
      throw 'Could not launch Maps';
    }
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
              ClipRect(
                  child: Align(
                alignment: Alignment.center,
                heightFactor: 0.8,
                child: Image.network(
                  place.photoUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )),
              const SizedBox(height: 20),
              Text(
                place.name,
                style: const TextStyle(
                    color: Color.fromRGBO(31, 27, 89, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                place.shortFormattedAddress,
                style: const TextStyle(
                    color: Color.fromRGBO(31, 27, 89, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                children: [_generateTypesTag(context)],
              ),
              const SizedBox(height: 20),
              NeithTextButton(
                  onPressed: () => _handleGoToGoogleMaps(place.googleMapsUri),
                  label: 'Go to Google Maps')
            ],
          )
        ],
      ),
    );
  }
}
