import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/data/model.dart';
import 'package:weather_app/screens/views.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWinterData;
  final dynamic parseAirData;

  const WeatherScreen({Key? key, required this.parseWinterData, required this.parseAirData}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  String cityName = '';
  int temp = 0;
  String des = "";
  String iconName = "";
  String airIconName = "";
  String airCondition = "";
  double dust1 = 0.0;
  double dust2 = 0.0;
  var date = DateTime.now();

  Views views = Views();

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWinterData, widget.parseAirData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    if (weatherData != null) {
      int condition = weatherData['weather'][0]['id'];
      int airIndex = airData['list'][0]['main']['aqi'];
      iconName = weatherData['weather'][0]['icon']; // model.getWeatehrIconName(condition);
      airIconName = model.getAirIconName(airIndex);
      airCondition = model.getAirCondition(airIndex);
      dust1 = airData['list'][0]['components']['pm10'];
      dust2 = airData['list'][0]['components']['pm2_5'];

      temp = ((weatherData['main']['temp'] - 273) as double).round();
      cityName = weatherData['name'];
      des = weatherData['weather'][0]['description'];

      print(condition);
    }
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30,
          )
        ],
      ),
      body: Stack(
        children: [
          views.setImageView('images/background.jpg', double.infinity, double.infinity, true), // fit: BoxFit.cover,
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 150),
                          views.setTextView('$cityName', 35.0, false),
                          Row(
                            children: [
                              TimerBuilder.periodic(
                                const Duration(minutes: 1),
                                builder: (context) {
                                  return views.setTextView(getSystemTime(), 16.0, false);
                                },
                              ),
                              views.setTextView(DateFormat(' - EEEE, ').format(date), 16.0, false),
                              views.setTextView(DateFormat('d MMM, yyy').format(date), 16.0, false),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$temp\u2103',
                            style: GoogleFonts.lato(
                              fontSize: 85.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              // SvgPicture.asset(
                              //   iconName,
                              //   color: Colors.black87,
                              // ),
                              CachedNetworkImage(
                                imageUrl: 'http://openweathermap.org/img/wn/$iconName@2x.png',
                              ),
                              const SizedBox(width: 10),
                              views.setTextView(des, 16.0, false),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(height: 15, thickness: 2, color: Colors.white30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            views.setTextView('AQI(대기질수)', 14.0, false),
                            const SizedBox(height: 10),
                            views.setImageView(airIconName, 37, 35, false),
                            const SizedBox(height: 10),
                            views.setTextView(airCondition, 14.0, true),
                          ],
                        ),
                        Column(
                          children: [
                            views.setTextView('미세먼지', 14.0, false),
                            const SizedBox(height: 10),
                            views.setTextView('$dust1', 24.0, false),
                            const SizedBox(height: 10),
                            views.setTextView('㎍/m3', 14.0, true),
                          ],
                        ),
                        Column(
                          children: [
                            views.setTextView('초미세먼지', 14.0, false),
                            const SizedBox(height: 10),
                            views.setTextView('$dust2', 24.0, false),
                            const SizedBox(height: 10),
                            views.setTextView('㎍/m3', 14.0, true),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
