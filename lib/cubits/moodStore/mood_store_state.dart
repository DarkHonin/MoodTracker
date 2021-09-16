part of './mood_store_cubit.dart';

class MoodStoreState {}

class MoodStoreInitState extends MoodStoreState {}

class MoodStoreLoadingState extends MoodStoreState {
  final String message;
  MoodStoreLoadingState(this.message);
}

class MoodStoreReadyState extends MoodStoreState {
  final List<MoodPoint> moodPoints;
  MoodStoreReadyState(this.moodPoints);
}

class MoodStoreErrorState extends MoodStoreState {
  final String message;
  MoodStoreErrorState(this.message);
}
