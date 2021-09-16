import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/moodStore/mood_store_cubit.dart';

class MoodView extends StatefulWidget {
  const MoodView({Key? key}) : super(key: key);

  @override
  _MoodViewState createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  @override
  initState() {
    super.initState();
    sl<MoodStoreCubit>().loadMoodStore('happy');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: BlocBuilder<MoodStoreCubit, MoodStoreState>(
          bloc: sl<MoodStoreCubit>(),
          builder: (c, state) {
            if (state is MoodStoreLoadingState) {
              return Center(
                child: Column(
                  children: [const CircularProgressIndicator(), Text(state.message)],
                ),
              );
            }
            if (state is MoodStoreReadyState) {
              return state.moodPoints.isEmpty
                  ? Column(children: const [Expanded(child: Center(child: Text("There are none")))])
                  : ListView(
                      children: state.moodPoints
                          .map((e) => ListTile(
                                title: Text('${e.dateTime.day}/${e.dateTime.month}/${e.dateTime.year}'),
                              ))
                          .toList(),
                    );
            }
            if (state is MoodStoreErrorState) {
              return Column(children: [Expanded(child: Center(child: Text(state.message)))]);
            }
            return Container();
          },
        ));
  }
}
