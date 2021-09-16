import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
part './mood_store_state.dart';

class MoodStoreCubit extends Cubit<MoodStoreState> {
  MoodStoreCubit() : super(MoodStoreInitState());

  Future<String> getLocalPath() async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    return path;
  }

  Future<void> loadMoodStore(String mood) async {
    emit(MoodStoreLoadingState());
  }
}
