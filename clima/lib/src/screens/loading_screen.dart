import 'package:flutter/material.dart';

import '../location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    final location = await Location.getCurrentLocation();
    print(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
