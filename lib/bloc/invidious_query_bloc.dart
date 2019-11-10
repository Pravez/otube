import 'package:bloc/bloc.dart';
import 'package:otube/service/invidious_query_event.dart';
import 'package:otube/service/invidious_repository.dart';
import 'package:otube/state/invidious_query_state.dart';

class InvidiousQueryBloc
    extends Bloc<InvidiousQueryEvent, InvidiousQueryState> {
  @override
  InvidiousQueryState get initialState => InvidiousQueryEmpty();

  @override
  void onTransition(
          Transition<InvidiousQueryEvent, InvidiousQueryState> transition) =>
      print(transition);

  @override
  Stream<InvidiousQueryState> mapEventToState(
      InvidiousQueryEvent event) async* {
    if (event is RefreshTrending) {
      yield* _loadList("trending");
    } else if (event is RefreshTop) {
      yield* _loadList("top");
    } else if (event is VideoQuery) {
      yield* _loadVideo(event);
    }
  }

  Stream<InvidiousQueryState> _loadList(String category) async* {
    yield InvidiousQueryLoading();
    try {
      final results = await (category == "top"
          ? InvidiousRepository.getTop
          : InvidiousRepository.getTrending)();
      yield InvidiousQuerySuccess(results);
    } catch (error) {
      yield InvidiousQueryError(
          'Something went wrong when asking for $category');
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
        yield InvidiousQueryError(
            "Unable to fetch video with id ${query.videoId}");
      }
    }
  }
}
