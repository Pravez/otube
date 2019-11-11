

import 'package:equatable/equatable.dart';

abstract class InvidiousVideoEvent extends Equatable {
  const InvidiousVideoEvent();

  @override
  List<Object> get props => [];
}

class VideoQuery extends InvidiousVideoEvent {
  final String videoId;

  VideoQuery({this.videoId});

  @override
  List<Object> get props => [videoId];
  @override
  String toString() => 'VideoQuery { videoId: $videoId }';
}