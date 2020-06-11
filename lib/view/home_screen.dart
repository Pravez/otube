import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/api/client/instance.dart';
import 'package:otube/blocs/home/bloc.dart';

class HomeScreen extends StatefulWidget {
  static const Route = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeFailureState) {
          Instance.changeInstance();
          _bloc.add(HomeVideosFetched());
          return Center(
            child: Text("Failed"),
          );
        }
        if (state is HomeSuccessState) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.list.videos[index].title),
              );
            },
            itemCount: state.list.videos.length,
          );
        }
        return null;
      },
    );
  }

  @override
  void initState() {
    _bloc = BlocProvider.of<HomeBloc>(context);
  }
}
