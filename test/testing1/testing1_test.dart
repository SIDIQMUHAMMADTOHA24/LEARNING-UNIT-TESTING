import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:unit_testing_flutter/testing1/model_testing1.dart';
import 'package:unit_testing_flutter/testing1/testing1.dart';

import '../main_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchData', () {
    test('returns a TestingModel1 if the http call completes successfully',
        () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://olt.kopibub.uk/api/mobile/get-user/924')))
          .thenAnswer((_) async => http.Response(
              '{"status": "Success", "data": {"id": 924, "privilege_id": 8, "name": "mahfud wahyudi kurniawan", "photo": "0", "phone": "082248245635", "address": "jalan jambon", "email": "wahyudhi.dev@gmail.com"}}',
              200));

      expect(await Testing1().fetchData(client), isA<TestingModel1>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://olt.kopibub.uk/api/mobile/get-user/924')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(Testing1().fetchData(client), throwsException);
    });

    test('returns an empty TestingModel1 if the data is empty', () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://olt.kopibub.uk/api/mobile/get-user/924')))
          .thenAnswer((_) async =>
              http.Response('{"status": "Success", "data": {}}', 200));

      final result = await Testing1().fetchData(client);

      expect(result.id, isNull);
      expect(result.name, isNull);
    });
  });
}
