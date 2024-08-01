import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unit_testing_flutter/testing2/model_testing2.dart';

class Testing2 {
  Future<TestingModel2> fetchData(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://olt.kopibub.uk/api/mobile/get-user/924'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return TestingModel2.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
