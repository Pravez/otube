import 'package:otube/api/client/api.dart';
import 'package:otube/api/client/client.dart';
import 'package:otube/infrastructure/injection.dart';

import 'client/dtos/complete_video.dart';
import 'client/dtos/video_comments.dart';
import 'client/dtos/video_list.dart';

class InvidiousApiClient implements Api<VideoList, CompleteVideo, VideoComments> {
  final HttpClient _client;

  InvidiousApiClient(this._client);

  @override
  top() async => _client.fetchJson("top").then((json) => VideoList.fromJson(json));

  @override
  trending() async =>
      _client.fetchJson("trending").then((json) => VideoList.fromJson(json));

  @override
  video(String videoId) async =>
      _client.fetchJson("videos/$videoId").then((json) => CompleteVideo.fromJson(json));

  @override
  comments(String videoId) async =>
      _client.fetchJson("comments/$videoId").then((json) => VideoComments.fromJson(json));

  @override
  home() async => throw Exception("Not implemented");
}
