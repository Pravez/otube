

import 'package:equatable/equatable.dart';

abstract class InvidiousQueryState extends Equatable {
  const InvidiousQueryState();

  @override
  List<Object> get props => [];
}

class InvidiousQueryEmpty extends InvidiousQueryState {}
class InvidiousQueryLoading extends InvidiousQueryState {}
class InvidiousQueryError extends InvidiousQueryState {
  final String errorMessage;

  InvidiousQueryError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'InvidiousQueryError { error: $errorMessage }';
}
class InvidiousQuerySuccess extends InvidiousQueryState {
  final dynamic result;

  InvidiousQuerySuccess(this.result);

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'InvidiousQuerySuccess { result: $result }';
}

