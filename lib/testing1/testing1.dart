import 'dart:convert';

import 'package:unit_testing_flutter/testing1/model_testing1.dart';
import 'package:http/http.dart' as http;

class Testing1 {
  Future<TestingModel1> fetchData(http.Client client) async {
    final response =
        await client.get(Uri.parse('https://olt.kopibub.uk/api/mobile/get-user/924'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return TestingModel1.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
