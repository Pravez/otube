import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/model/complete_video.dart';
import 'package:otube/utils/utils.dart';

class VideoDetails extends StatelessWidget {
  final CompleteVideo video;

  const VideoDetails({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _detailRow("Genre", video.genre, style: FontStyle.italic)
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_up,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(Utils.formatLikeCount(video.likeCount)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_down,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(Utils.formatLikeCount(video.dislikeCount)),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  _detailRow(String fieldName, String fieldValue,
      {FontStyle style = FontStyle.normal}) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("$fieldName :"),
          Text(
            fieldValue,
            style: TextStyle(fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}