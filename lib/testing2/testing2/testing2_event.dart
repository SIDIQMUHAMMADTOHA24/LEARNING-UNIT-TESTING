part of 'testing2_bloc.dart';

sealed class Testing2Event extends Equatable {
  const Testing2Event();

  @override
  List<Object> get props => [];
}

class GetUser extends Testing2Event {}
