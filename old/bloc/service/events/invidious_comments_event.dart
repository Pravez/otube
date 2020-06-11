import 'package:equatable/equatable.dart';

abstract class InvidiousCommentsEvent extends Equatable {
  const InvidiousCommentsEvent();

  @override
  List<Object> get props => [];
}

class CommentsQuery extends InvidiousCommentsEvent {
  final String commentId;

  CommentsQuery({this.commentId});

  @override
  List<Object> get props => [commentId];
  @override
  String toString() => 'CommentsQuery { commentId: $commentId }';
}