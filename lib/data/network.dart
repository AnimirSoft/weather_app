import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String url2;
  Network(this.url, this.url2);

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2), headers: headers);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
