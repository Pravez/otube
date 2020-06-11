import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:otube/api/invidious_api_client.dart';
import 'package:otube/infrastructure/injection.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final InvidiousApiClient client = Injection.get<InvidiousApiClient>();

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeVideosFetched) {
      try {
        final videos = await client.trending();
        yield HomeSuccessState(list: videos);
      } catch (e) {
        print(e);
        yield HomeFailureState();
      }
    }
  }

  @override
  Stream<Transition<HomeEvent, HomeState>> transformEvents(
    Stream<HomeEvent> events,
    TransitionFunction<HomeEvent, HomeState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }
}
