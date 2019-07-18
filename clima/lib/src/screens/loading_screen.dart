import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart' as Constants;
import '../location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location _location;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    _location = await Location.getCurrentLocation();

    getData();
  }

  void getData() async {
    final response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=${Constants.apiKey}');

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
