import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/moods/moods_cubit.dart';

import 'package:mood_tracker/ui/widgets/mood_slider.dart';

class MoodMetricView extends StatefulWidget {
  const MoodMetricView({Key? key}) : super(key: key);

  @override
  _MoodMetricViewState createState() => _MoodMetricViewState();
}

class _MoodMetricViewState extends State<MoodMetricView> {
  Map<String, double> metric = {};

  _updateMoodScore(String title, double v) {
    metric[title] = v;
  }

  @override
  void initState() {
    super.initState();
    sl<MoodsCubit>().loadMoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [MaterialButton(onPressed: () {}, child: Text("Take metric", style: TextStyle(color: Colors.white, fontSize: 18)))],
        ),
        body: Padding(
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
                            title: state.moods[index].name,
                            callback: _updateMoodScore,
                          );
                        },
                      );

                      // return ListView(
                      //   children: state.moods.map((e) => MoodSlider(title: e.name)).toList(),
                      // );
                    }
                    if (state is MoodsErrorState) {
                      return Text("No moods to load");
                    }
                    return Container();
                  },
                )),
          ),
        ));
  }
}
