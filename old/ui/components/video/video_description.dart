

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/model/complete_video.dart';

class VideoDescription extends StatelessWidget {
  final CompleteVideo video;

  const VideoDescription({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          iconColor: Colors.black87,
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
          collapsed: Text(
            video.description,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    video.description,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  )),
            ],
          ),
          builder: (_, collapsed, expanded) {
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Expandable(
                collapsed: collapsed,
                expanded: expanded,
                crossFadePoint: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
