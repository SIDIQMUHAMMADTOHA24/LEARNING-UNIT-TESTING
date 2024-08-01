import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unit_testing_flutter/testing2/model_testing2.dart';
import 'package:unit_testing_flutter/testing2/testing2.dart';
import 'package:http/http.dart' as http;

part 'testing2_event.dart';
part 'testing2_state.dart';

class Testing2Bloc extends Bloc<Testing2Event, Testing2State> {
  final Testing2 testing2;

  Testing2Bloc(this.testing2) : super(Testing2Initial()) {
    on<GetUser>(_onGetUser);
  }

  Future<void> _onGetUser(GetUser event, Emitter<Testing2State> emit) async {
    emit(Testing2Loading());

    try {
      final data = await testing2.fetchData(http.Client());
      emit(Testing2Success(data));
    } catch (e) {
      emit(Testing2Failure(e.toString()));
    }
  }
}
