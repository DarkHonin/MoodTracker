part of './moods_cubit.dart';

class MoodsState {
  final MoodStoreEntity moodStore;

  MoodsState(this.moodStore);
}

class MoodsLoadingState extends MoodsState {
  MoodsLoadingState(MoodStoreEntity entity) : super(entity);
}

class MoodsLoadedState extends MoodsState {
  MoodsLoadedState(MoodStoreEntity entity) : super(entity);
}

class MoodsErrorState extends MoodsState {
  MoodsErrorState(MoodStoreEntity entity) : super(entity);
}
