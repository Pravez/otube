import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:otube/model/complete_video.dart';
import 'package:otube/utils/utils.dart';

class InvidiousVideoDescription extends StatelessWidget {
  final CompleteVideo video;

  const InvidiousVideoDescription({Key key, @required this.video})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          _buildTitle(),
          Divider(
            color: Colors.black38,
          ),
          _buildDetails(),
          _buildDescription()
        ],
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
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
      ),
    );
  }

  _buildDetails() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
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
      ),
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

  _buildDescription() {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          collapsed: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              video.description,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          expanded: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              video.description,
              softWrap: true,
            ),
          ),
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
          hasIcon: true,

        ),
      ),
    );
  }
}
