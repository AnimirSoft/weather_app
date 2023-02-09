import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude = 0.0;
  double longitude = 0.0;
  String apiKey = "becf8c055171264bd2ab7e8a45350954";

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
