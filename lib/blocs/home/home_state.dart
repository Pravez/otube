import 'package:equatable/equatable.dart';
import 'package:otube/api/client/dtos/video_list.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeFailureState extends HomeState {}

class HomeSuccessState extends HomeState {
  final VideoList list;

  const HomeSuccessState({this.list});

  @override
  List<Object> get props => [list];
}