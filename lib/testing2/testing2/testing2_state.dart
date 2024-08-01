part of 'testing2_bloc.dart';

sealed class Testing2State extends Equatable {
  const Testing2State();

  @override
  List<Object> get props => [];
}

final class Testing2Initial extends Testing2State {}

final class Testing2Loading extends Testing2State {}

final class Testing2Success extends Testing2State {
  final TestingModel2 data;

  const Testing2Success(this.data);

  @override
  List<Object> get props => [data];
}

final class Testing2Failure extends Testing2State {
  final String message;

  const Testing2Failure(this.message);

  @override
  List<Object> get props => [message];
}
