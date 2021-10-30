import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api.dart';
import 'package:oauth_with_bloc/data/models/breed.dart';
import 'package:http/http.dart' as http;

class TheCatApiRepository {
  final int _limit = 15;

  Future<List<Breed>> getBreedsList(int _page) async {
    try {
      final http.Response response = await http.get(
          CatApi.getUrWithQuery('/breeds', {
            "limit": "$_limit",
            "page": "$_page",
          }),
          headers: {
            'contentType': 'application/json',
          });

      if (response.statusCode == 200) {
        return compute(parseBreeds, response.body);
      } else {
        throw Exception('Uknown error - code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Breed>> getBreedListByName(String name) async {
    try {
      final http.Response response = await http.get(
          CatApi.getUrWithQuery('/breeds/search', {"limit": "30", "q": name}),
          headers: {
            'contentType': 'application/json',
          });
      if (response.statusCode == 200) {
        return compute(parseBreeds, response.body);
        // return parseBreeds(response.body);
      } else {
        throw Exception('Uknown error - code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}

List<Breed> parseBreeds(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Breed>((json) {
    return Breed.fromJson(json);
  }).toList();
}
