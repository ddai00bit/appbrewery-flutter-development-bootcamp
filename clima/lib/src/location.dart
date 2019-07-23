import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;

  Location._({this.latitude, this.longitude});

  @override
  String toString() {
    return 'lat: $latitude, lng: $longitude';
  }

  static Future<Location> getCurrentLocation() async {
    try {
      final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return Location._(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      return Location._(
        latitude: 0,
        longitude: 0,
      );
    }
  }
}
