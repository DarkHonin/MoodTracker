part of './mood_store_cubit.dart';

class MoodStoreState {
  final Map<String, MoodPoint> moodPoints;
  final String message;
  MoodStoreState(this.moodPoints, this.message) {
    print("MoodStoreState: $moodPoints");
  }
}

class MoodStoreLoadingState extends MoodStoreState {
  MoodStoreState state;
  MoodStoreLoadingState(message, this.state) : super(state.moodPoints, message);
}

class MoodStoreReadyState extends MoodStoreState {
  MoodStoreState state;
  MoodStoreReadyState(moodPoints, this.state) : super(moodPoints, "");
}

class MoodStoreErrorState extends MoodStoreState {
  MoodStoreState state;
  MoodStoreErrorState(message, this.state) : super(state.moodPoints, message);
}

class MoodStoreSavedState extends MoodStoreState {
  MoodStoreState state;
  MoodStoreSavedState(this.state) : super(state.moodPoints, state.message);
}
