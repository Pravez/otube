import 'package:bloc/bloc.dart';
import 'package:otube/service/invidious_query_event.dart';
import 'package:otube/service/invidious_query_type.dart';
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
     if (event is Refresh) {
      yield* _loadList(event.type);
    } else if (event is VideoQuery) {
      yield* _loadVideo(event);
    }
  }

  Stream<InvidiousQueryState> _loadList(InvidiousQueryType type) async* {
    yield InvidiousQueryLoading();
    try {
      final results = await (type == InvidiousQueryType.TOP
          ? InvidiousRepository.getTop
          : InvidiousRepository.getTrending)();
      yield InvidiousQuerySuccess(results);
    } catch (error) {
      yield InvidiousQueryError(
          'Something went wrong when asking for $type');
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
