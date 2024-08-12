import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    'https://us-central1-neith-app-project.cloudfunctions.net/api/v1/travel-plans';

Future<void> createTravelPlan(
    String preferredTime,
    List<String> tourismTypes,
    int travelerCount,
    int travelDuration,
    int arrivalHour,
    int departureHour) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response =
      await http.post(Uri.parse('$apiUrl/4e827457-e718-417f-b4ea-a3918936be31'),
          headers: requestHeaders,
          body: jsonEncode(<String, dynamic>{
            'preferredTime': preferredTime,
            'tourismTypes': tourismTypes,
            'travelerCount': travelerCount,
            'travelDuration': travelDuration,
            'arrivalHour': arrivalHour,
            'departureHour': departureHour,
          }));

  if (response.statusCode == 200) {
    final resFormatted = jsonDecode(response.body);
    debugPrint(resFormatted);
  } else {
    throw Exception('failed to create user');
  }
}

Future<void> generateTravelPlan(String planId) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.post(Uri.parse('$apiUrl/$planId/generate'),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    final resFormatted = jsonDecode(response.body);
    debugPrint(resFormatted);
  } else {
    throw Exception('failed to create user');
  }
}
