import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/core/navigation.dart';
import 'package:mood_tracker/cubits/moods/moods_cubit.dart';

class MoodsView extends StatefulWidget {
  const MoodsView({Key? key}) : super(key: key);

  @override
  _MoodsViewState createState() => _MoodsViewState();
}

class _MoodsViewState extends State<MoodsView> {
  final TextEditingController _moodInput = TextEditingController();

  Widget _createDialog(c) {
    return SimpleDialog(
      children: [
        SizedBox(
            width: 400,
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Create Mood:"),
                    TextField(
                      controller: _moodInput,
                    )
                  ],
                ))),
        MaterialButton(
            onPressed: () {
              sl<MoodsCubit>().createMood(_moodInput.text);
              Navigator.pop(c);
            },
            child: Text("Create"),
            color: Colors.green)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Moods"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(context: context, builder: _createDialog);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Center(
          child: BlocBuilder<MoodsCubit, MoodsState>(
            bloc: sl<MoodsCubit>(),
            builder: (c, state) {
              if (state is MoodsLoadedState) {
                return SizedBox(
                    width: 400,
                    child: ListView(
                      children: state.moods.keys
                          .map((e) => ListTile(
                                title: Text(e),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_right),
                                  onPressed: () => Navigator.pushNamed(
                                      context, Navigation.MOOD_HISTORY,
                                      arguments: e),
                                ),
                              ))
                          .toList(),
                    ));
              }
              if (state is MoodsLoadedState) {
                return CircularProgressIndicator();
              }
              if (state is MoodsErrorState) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ));
  }
}
