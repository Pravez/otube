import 'package:bloc/bloc.dart';
import 'package:otube/bloc/service/invidious_repository.dart';
import 'package:otube/bloc/service/events/invidious_video_event.dart';
import 'package:otube/bloc/state/invidious_query_state.dart';

class InvidiousVideoBloc
    extends Bloc<InvidiousVideoEvent, InvidiousQueryState> {
  @override
  InvidiousQueryState get initialState => InvidiousQueryEmpty();

  @override
  void onTransition(
      Transition<InvidiousVideoEvent, InvidiousQueryState> transition) =>
      print(transition);

  @override
  Stream<InvidiousQueryState> mapEventToState(
      InvidiousVideoEvent event) async* {

    if (event is VideoQuery) {
      yield* _loadVideo(event);
    }
  }

  Stream<InvidiousQueryState> _loadVideo(VideoQuery query) async* {
    if (query.videoId.isEmpty) {
      yield InvidiousQueryEmpty();
    } else {
      yield InvidiousQueryLoading();
      try {
        final results = await InvidiousRepository.getVideo(query.videoId);
        yield InvidiousQuerySuccess(results);
      } catch (error) {
        print(error.toString());
        yield InvidiousQueryError(
            "Unable to fetch video with id ${query.videoId}");
      }
    }
  }
}
