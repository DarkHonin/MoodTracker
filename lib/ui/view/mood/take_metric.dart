import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/core/navigation.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/moodStore/mood_store_cubit.dart';
import 'package:mood_tracker/cubits/moods/moods_cubit.dart';

import 'package:mood_tracker/ui/widgets/mood_slider.dart';

class MoodMetricView extends StatefulWidget {
  const MoodMetricView({Key? key}) : super(key: key);

  @override
  _MoodMetricViewState createState() => _MoodMetricViewState();
}

class _MoodMetricViewState extends State<MoodMetricView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
              onPressed: () {
                sl<MoodStoreCubit>().commitStore();
              },
              child: Text("Take metric",
                  style: TextStyle(color: Colors.white, fontSize: 18)))
        ],
      ),
      body: BlocListener(
          bloc: sl<MoodStoreCubit>(),
          listener: (c, state) {
            if (state is MoodStoreSavedState) {
              ScaffoldMessenger.of(c).showSnackBar(SnackBar(
                content: Text("Status saved"),
                duration: Duration(seconds: 3),
              ));
              Navigator.pushNamed(context, Navigation.HOME_VIEW);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: SizedBox(
                  width: 400,
                  child: BlocBuilder<MoodsCubit, MoodsState>(
                    bloc: sl<MoodsCubit>(),
                    builder: (c, state) {
                      if (state is MoodsLoadingState) {
                        return CircularProgressIndicator();
                      }
                      if (state is MoodsLoadedState) {
                        return ListView.builder(
                          itemCount: state.moods.length,
                          itemBuilder: (context, index) {
                            return MoodSlider(
                                title: state.moods.keys.toList()[index]);
                          },
                        );
                      }
                      if (state is MoodsErrorState) {
                        return Text("No moods to load");
                      }
                      return Container();
                    },
                  )),
            ),
          )),
    );
  }
}
