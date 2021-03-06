import 'package:get_it/get_it.dart';
import 'package:mood_tracker/cubits/moods/moods_cubit.dart';
import 'package:mood_tracker/cubits/moodStore/mood_store_cubit.dart';
import 'package:mood_tracker/repo/local_storage_mood_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mood_tracker/cubits/tag_edit/tag_edit_cubit.dart';

final sl = GetIt.instance;

class DependencyInjection {
  Future<void> init() async {
    await _cubits();
    await _repos();
  }

  Future<void> _cubits() async {
    sl.registerLazySingleton<MoodStoreCubit>(() => MoodStoreCubit());
    sl.registerLazySingleton<MoodsCubit>(() => MoodsCubit());
    sl.registerLazySingleton<TagEditCubit>(() => TagEditCubit());
  }

  Future<void> _repos() async {
    sl.registerLazySingleton<LocalStorageMoodRepo>(
        () => LocalStorageMoodRepo());
  }
}
