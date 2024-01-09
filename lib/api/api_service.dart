import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../model/album_model.dart';

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
        .get(Uri.parse('https://random-data-api.com/api/v2/users?size=2'));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
