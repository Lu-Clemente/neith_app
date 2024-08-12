import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    'https://us-central1-neith-app-project.cloudfunctions.net/api/v1/users';

Future<UserInfo> postUser(String name, String birthday) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.post(Uri.parse(apiUrl),
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        'name': name,
        'birthday': birthday,
        'externalId': user!.uid
      }));

  if (response.statusCode == 200) {
    final resFormatted = jsonDecode(response.body);
    return UserInfo.fromJson(resFormatted);
  } else {
    throw Exception('failed to create user');
  }
}

Future<void> updateUser(
    List<String> disabilities, List<String> restaurantDietTags) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.put(Uri.parse(apiUrl),
      headers: requestHeaders,
      body: jsonEncode(<String, dynamic>{
        'disabilities': disabilities,
        'restaurantDietTags': restaurantDietTags,
      }));

  if (response.statusCode == 200) {
  } else {
    throw Exception('failed to create user');
  }
}

class UserInfo {
  final String name;
  final String birthday;
  final String externalId;
  final String id;

  UserInfo(this.name, this.birthday, this.externalId, this.id);

  UserInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        birthday = json['birthday'],
        externalId = json['externalId'],
        id = json['id'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'birthday': birthday, 'externalId': externalId, 'id': id};
}
