

import 'package:equatable/equatable.dart';

abstract class InvidiousQueryEvent extends Equatable {
  const InvidiousQueryEvent();

  @override
  List<Object> get props => [];
}

class RefreshTop extends InvidiousQueryEvent {}
class RefreshTrending extends InvidiousQueryEvent {}
class VideoQuery extends InvidiousQueryEvent {
  final String videoId;

  VideoQuery({this.videoId});

  @override
  List<Object> get props => [videoId];
  @override
  String toString() => 'VideoQuery { videoId: $videoId }';
}