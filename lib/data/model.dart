import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  String getWeatehrIconName(int condition) {
    String fileName = "";
    if (condition >= 200 && condition < 233) {
      fileName = 'svg/Cloud-Lightning.svg';
    } else if (condition >= 300 && condition < 322) {
      fileName = 'svg/Cloud-Rain.svg';
    } else if (condition >= 500 && condition < 505) {
      fileName = 'svg/Cloud-Rain.svg';
    } else if (condition == 511) {
      fileName = 'svg/Cloud-Rain-Alt.svg';
    } else if (condition >= 520 && condition < 532) {
      fileName = 'svg/Cloud-Rain-Moon.svg';
    } else if (condition >= 600 && condition < 623) {
      fileName = 'svg/Cloud_Sun.svg';
    } else if (condition >= 701 && condition < 782) {
      fileName = 'svg/Cloud-Fog-Alt.svg';
    } else if (condition == 800) {
      fileName = 'svg/Sun.svg';
    } else if (condition == 801) {
      fileName = 'svg/Cloud-Sun.svg';
    } else if (condition == 802) {
      fileName = 'svg/Cloud.svg';
    } else if (condition == 803 || condition == 804) {
      fileName = 'svg/Cloud-Moon.svg';
    }
    print(fileName);
    return fileName;
  }

  String getAirIconName(int index) {
    String fileName = "";
    if (index == 1) {
      fileName = 'images/good.png';
    } else if (index == 2) {
      fileName = 'images/fair.png';
    } else if (index == 3) {
      fileName = 'images/moderate.png';
    } else if (index == 4) {
      fileName = 'images/poor.png';
    } else if (index == 5) {
      fileName = 'images/bad.png';
    }

    return fileName;
  }

  String getAirCondition(int index) {
    String fileName = "";
    if (index == 1) {
      fileName = '매우좋음';
    } else if (index == 2) {
      fileName = '좋음';
    } else if (index == 3) {
      fileName = '보통';
    } else if (index == 4) {
      fileName = '나쁨';
    } else if (index == 5) {
      fileName = '매우나쁨';
    }

    return fileName;
  }
}
