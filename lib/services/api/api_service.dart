import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:profile_app/model/weather_model.dart';

import '../../model/album_model.dart';

class ApiService {
  Future<Album> fetchAlbum() async {
    final response = await http.get(
      Uri.parse("https://random-data-api.com/api/v2/users"),
    );
    // await http.get(Uri.parse('https://random-data-api.com/api/v2/users'));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Album>> fetchAlbumList() async {
    final response = await http
        .get(Uri.parse('https://random-data-api.com/api/v2/users?size=5'));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<WeatherModel?> fetchWeatherData(
      {String? lat = "44.34", String? lon = "10.99"}) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=20177d1fa45e56e2e1a58712faa338a7'),
      );

      debugPrint("========");

      if (response.statusCode == 200) {
        debugPrint(response.body);
        return WeatherModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
