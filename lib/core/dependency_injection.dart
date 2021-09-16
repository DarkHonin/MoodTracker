import 'package:get_it/get_it.dart';
import '../helper/json_helper.dart';
import 'package:mood_tracker/cubits/moodStore/mood_store_cubit.dart';

final sl = GetIt.instance;

class DependencyInjection {
  Future<void> init() async {
    await _cubits();
    await _repos();

    sl.registerLazySingleton<JsonHelper>(() => JsonHelper());
  }

  Future<void> _cubits() async {
    sl.registerLazySingleton<MoodStoreCubit>(() => MoodStoreCubit(sl()));
  }

  Future<void> _repos() async {}
}
