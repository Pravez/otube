

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/model/complete_video.dart';

class VideoTitle extends StatelessWidget {
  final CompleteVideo video;

  const VideoTitle({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Icon(
            Icons.account_circle,
            size: 40,
          ),
          flex: 2,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Text(
                  video.title,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Text(
                video.author,
                style: TextStyle(fontSize: 12.0),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          flex: 9,
        ),
      ],
    );
  }
}