import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    'https://us-central1-neith-app-project.cloudfunctions.net/api/v1/places';

Future<Iterable<SearchPlace>> fetchSearch(String keyword) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.get(Uri.parse('$apiUrl?text=$keyword&limit=20'),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    final searchList = jsonDecode(response.body) as List<dynamic>;

    final Iterable<SearchPlace> searchListFormatted = searchList.isNotEmpty
        ? searchList.map((el) => SearchPlace.fromJson(el))
        : [];

    return searchListFormatted;
  } else {
    throw Exception('failed to search');
  }
}

class SearchPlace {
  final String name;
  final String shortFormattedAddress;
  final String photoUrl;

  SearchPlace(this.name, this.shortFormattedAddress, this.photoUrl);

  SearchPlace.fromJson(Map<String, dynamic> json)
      : name = json['displayName']['text'] as String,
        shortFormattedAddress = json['shortFormattedAddress'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'shortFormattedAddress': shortFormattedAddress,
        'photoUrl': photoUrl
      };
}
