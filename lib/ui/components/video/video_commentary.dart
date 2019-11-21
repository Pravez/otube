import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/bloc/invidious_video_comments_block.dart';
import 'package:otube/bloc/service/events/invidious_comments_event.dart';
import 'package:otube/bloc/state/invidious_query_state.dart';
import 'package:otube/model/complete_video.dart';
import 'package:otube/model/video_comment.dart';
import 'package:otube/model/video_comments.dart';

class VideoCommentary extends StatefulWidget {
  final CompleteVideo video;

  const VideoCommentary({Key key, this.video}) : super(key: key);

  @override
  _VideoCommentaryState createState() => _VideoCommentaryState();
}

class _VideoCommentaryState extends State<VideoCommentary> {
  InvidiousVideoCommentsBloc _commentsBloc;

  @override
  void initState() {
    super.initState();
    _commentsBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvidiousVideoCommentsBloc, InvidiousQueryState>(
      bloc: BlocProvider.of(context),
      builder: (context, state) {
        if (state is InvidiousQueryLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is InvidiousQuerySuccess) {
          return _VideoCommentaryHandler(comments: state.result);
        } else {
          final List<Widget> loadLine = [];
          if (state is InvidiousQueryLoading) {
            loadLine.add(CircularProgressIndicator());
          } else {
            loadLine.add(Text("Load comments"));
          }
          if (state is InvidiousQueryError) {
            loadLine.add(Icon(Icons.error_outline));
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: loadLine,
                ),
                onPressed: () => _commentsBloc
                    .add(CommentsQuery(commentId: widget.video.videoId)),
              ),
            ),
          );
        }

        return Text("Nothing here ...");
      },
    );
  }
}

class _VideoCommentaryHandler extends StatefulWidget {
  final VideoComments comments;

  const _VideoCommentaryHandler({Key key, this.comments}) : super(key: key);

  @override
  __VideoCommentaryHandlerState createState() =>
      __VideoCommentaryHandlerState();
}

class __VideoCommentaryHandlerState extends State<_VideoCommentaryHandler> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.comments.comments
          .map((comment) => _buildTile(comment))
          .toList(),
    );
  }

  ListTile _buildTile(VideoComment comment) {
    return ListTile(
      title: Text(comment.content),
    );
  }
}
