import 'package:bloc/bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/moods/moods_cubit.dart';

import 'package:mood_tracker/models/mood_point.dart';

part './mood_store_state.dart';

class MoodStoreCubit extends Cubit<MoodStoreState> {
  MoodStoreCubit() : super(MoodStoreState({}, ""));

  setMoodValue(String name, double value) async {
    if (!state.moodPoints.containsKey(name)) {
      state.moodPoints[name] = MoodPoint(DateTime.now(), value);
    } else {
      state.moodPoints[name]?.value = value;
    }
  }

  commitStore() async {
    emit(MoodStoreLoadingState("Saving...", state));
    MoodsCubit moodsCubit = sl<MoodsCubit>();
    state.moodPoints.forEach((key, value) {
      moodsCubit.addMoodPoint(key, value.clone());
    });
    await moodsCubit.save();
    emit(MoodStoreSavedState(state));
  }
}
