import 'package:bloc/bloc.dart';
import 'package:otube/bloc/service/events/invidious_comments_event.dart';
import 'package:otube/bloc/service/invidious_repository.dart';
import 'package:otube/bloc/state/invidious_query_state.dart';

class InvidiousVideoCommentsBloc
    extends Bloc<InvidiousCommentsEvent, InvidiousQueryState> {
  @override
  InvidiousQueryState get initialState => InvidiousQueryEmpty();

  @override
  void onTransition(
      Transition<InvidiousCommentsEvent, InvidiousQueryState> transition) =>
      print(transition);

  @override
  Stream<InvidiousQueryState> mapEventToState(
      InvidiousCommentsEvent event) async* {

    if (event is CommentsQuery) {
      yield* _loadComments(event);
    }
  }

  Stream<InvidiousQueryState> _loadComments(CommentsQuery query) async* {
    if (query.commentId.isEmpty) {
      yield InvidiousQueryEmpty();
    } else {
      yield InvidiousQueryLoading();
      try {
        final results = await InvidiousRepository.getComments(query.commentId);
        yield InvidiousQuerySuccess(results);
      } catch (error) {
        print(error.toString());
        yield InvidiousQueryError(
            "Unable to fetch comments with id ${query.commentId}");
      }
    }
  }
}
