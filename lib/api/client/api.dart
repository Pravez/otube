
class Api<VideoList, Video, VideoComments> {
  Future<VideoList> top() async {}
  Future<VideoList> trending() async {}
  Future<VideoList> home() async {}
  Future<Video> video(String videoId) async {}
  Future<VideoComments> comments(String videoId) async {}
}