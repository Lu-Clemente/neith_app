import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    'https://us-central1-neith-app-project.cloudfunctions.net/api/v1/travel-plans';

Future<TravelPlan> createTravelPlan(
    String name,
    List<String> preferredTime,
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

  final response = await http.post(Uri.parse(apiUrl),
      headers: requestHeaders,
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'preferredTime': preferredTime,
        'tourismTypes': tourismTypes,
        'travelerCount': travelerCount,
        'travelDuration': travelDuration,
        'arrivalHour': arrivalHour,
        'departureHour': departureHour,
      }));

  if (response.statusCode == 200) {
    final resFormatted = jsonDecode(response.body);
    debugPrint('Oi enfermeira');
    final TravelPlan travelPlanFormatted = TravelPlan.fromJson(resFormatted);

    return travelPlanFormatted;
  } else {
    throw Exception('failed to create travel plan');
  }
}

Future<TravelPlan> generateTravelPlan(String planId) async {
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
    debugPrint('Oi enfermeira');
    final TravelPlan travelPlanFormatted = TravelPlan.fromJson(resFormatted);

    return travelPlanFormatted;
  } else {
    throw Exception('failed to generate planId $planId');
  }
}

Future<void> startTravelPlan(String planId) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.post(Uri.parse('$apiUrl/$planId/start'),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    /*   final resFormatted = jsonDecode(response.body);
    debugPrint(resFormatted); */
  } else {
    throw Exception('failed to start planId $planId');
  }
}

Future<void> finishTravelPlan(String planId) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.post(Uri.parse('$apiUrl/$planId/finish'),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    /*  final resFormatted = jsonDecode(response.body);
    debugPrint(resFormatted); */
  } else {
    throw Exception('failed to finish planId $planId');
  }
}

Future<Iterable<TravelPlan>> getTravelPlans() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final userToken = await user?.getIdToken();

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${userToken.toString()}',
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };

  final response = await http.get(Uri.parse(apiUrl), headers: requestHeaders);

  if (response.statusCode == 200) {
    final resFormatted = jsonDecode(response.body) as List<dynamic>;

    final Iterable<TravelPlan> travelPlanFormatted = resFormatted.isNotEmpty
        ? resFormatted.map((el) => TravelPlan.fromJson(el))
        : [];

    return travelPlanFormatted;
  } else {
    throw Exception('failed to get travel plans');
  }
}

class TravelPlan {
  final String? id;
  final String name;
  final int departureHour;
  final List<dynamic> preferredTime;
  final int travelerCount;
  final int travelDuration;
  final int arrivalHour;
  final List<dynamic> tourismTypes;
  final String userId;
  final List<dynamic>? tips;
  final Map<String, dynamic>? plan;
  final int? startDate;
  final int? endDate;

  TravelPlan(
      this.id,
      this.name,
      this.departureHour,
      this.preferredTime,
      this.travelerCount,
      this.travelDuration,
      this.arrivalHour,
      this.tourismTypes,
      this.userId,
      this.tips,
      this.plan,
      this.startDate,
      this.endDate);

  TravelPlan.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? json['id'],
        name = json['name'],
        departureHour = json['departureHour'],
        preferredTime = json['preferredTime'],
        travelerCount = json['travelerCount'],
        travelDuration = json['travelDuration'],
        arrivalHour = json['arrivalHour'],
        tourismTypes = json['tourismTypes'],
        userId = json['userId'],
        tips = json['tips'],
        plan = json['plan'],
        startDate =
            json['startDate'] != null ? json['startDate']['_seconds'] : null,
        endDate = json['endDate'] != null ? json['endDate']['_seconds'] : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'departureHour': departureHour,
        'preferredTime': preferredTime,
        'travelerCount': travelerCount,
        'travelDuration': travelDuration,
        'arrivalHour': arrivalHour,
        'tourismTypes': tourismTypes,
        'userId': userId,
        'tips': tips,
        'plan': plan,
        'startDate': startDate,
        'endDate': endDate
      };
}

class TravelPlanSchedule {
  final String activity;
  final String location;
  final String time;

  TravelPlanSchedule(this.activity, this.location, this.time);
}

class TravelPlanDay {
  final List<TravelPlanSchedule> days;

  TravelPlanDay(this.days);
}
