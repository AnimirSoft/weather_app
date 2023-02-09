import 'package:flutter/material.dart';
import 'package:weather_app/data/mylocation.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void getLocation(context) async {
  MyLocation myLocation = MyLocation();
  await myLocation.getMyCurrentLocation();

  Network network = Network("https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=${myLocation.apiKey}",
      "http://api.openweathermap.org/data/2.5/air_pollution?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=${myLocation.apiKey}");
  dynamic parseJsonData = await network.getJsonData();
  dynamic parseAirData = await network.getAirData();

  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return WeatherScreen(
      parseWinterData: parseJsonData,
      parseAirData: parseAirData,
    );
  }));
}
