import 'package:bloc/bloc.dart';
import 'package:mood_tracker/helper/json_helper.dart';
import 'package:mood_tracker/models/mood_point.dart';

part './mood_store_state.dart';

class MoodStoreCubit extends Cubit<MoodStoreState> {
  final JsonHelper json_helper;

  MoodStoreCubit(JsonHelper this.json_helper) : super(MoodStoreInitState());

  loadMoodStore(String mood) async {
    emit(MoodStoreLoadingState('Loading your mood: $mood'));
    try {
      Map<String, dynamic> preParse = await json_helper.readJson('$mood.store.json');
    } catch (e) {
      emit(MoodStoreErrorState('Failed to read mood: $mood'));
      print('Failed to read mood: $mood');
    }
  }
}
