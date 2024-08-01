import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing_flutter/testing2/model_testing2.dart';
import 'package:unit_testing_flutter/testing2/testing2.dart';
import 'package:http/http.dart' as http;
import 'package:unit_testing_flutter/testing2/testing2/testing2_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import 'testing2_test.mocks.dart';

@GenerateMocks([http.Client, Testing2])
void main() {
  late Testing2Bloc testing2Bloc;
  late MockTesting2 mockTesting2;
  late MockClient mockClient;

  setUp(() {
    mockTesting2 = MockTesting2();
    mockClient = MockClient();
    testing2Bloc = Testing2Bloc(mockTesting2);
  });

  blocTest<Testing2Bloc, Testing2State>(
    'emits [Testing2Loading, Testing2Success] when data fetching is successful',
    build: () {
      when(mockTesting2.fetchData(any)).thenAnswer(
        (_) async => const TestingModel2(
          id: 924,
          privilegeId: 8,
          name: 'mahfud wahyudi kurniawan',
          photo: '0',
          phone: '082248245635',
          address: 'jalan jambon',
          email: 'wahyudhi.dev@gmail.com',
        ),
      );
      return testing2Bloc;
    },
    act: (bloc) => bloc.add(GetUser()),
    expect: () => [
      Testing2Loading(),
      const Testing2Success(TestingModel2(
        id: 924,
        privilegeId: 8,
        name: 'mahfud wahyudi kurniawan',
        photo: '0',
        phone: '082248245635',
        address: 'jalan jambon',
        email: 'wahyudhi.dev@gmail.com',
      )),
    ],
  );

  blocTest<Testing2Bloc, Testing2State>(
    'emits [Testing2Loading, Testing2Failure] when data fetching fails',
    build: () {
      when(mockTesting2.fetchData(any))
          .thenThrow(Exception('Failed to load data'));
      return testing2Bloc;
    },
    act: (bloc) => bloc.add(GetUser()),
    expect: () => [
      Testing2Loading(),
      const Testing2Failure('Exception: Failed to load data'),
    ],
  );
}
