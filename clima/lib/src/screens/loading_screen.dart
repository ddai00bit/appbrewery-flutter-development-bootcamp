import 'package:flutter/material.dart';

import '../constants.dart' as Constants;
import '../location.dart';
import '../network_helper.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location _location;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    _location = await Location.getCurrentLocation();

    final helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=${Constants.apiKey}');
    final weatherData = await helper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
