part of './moods_cubit.dart';

class MoodsState {
  final Map<String, Mood> moods;
  final String message;

  MoodsState(this.moods, this.message) {
    print("MoodsState: $moods");
  }
}

class MoodPointsLoadedState extends MoodsState {
  MoodsState state;
  MoodPointsLoadedState(this.state) : super(state.moods, state.message);
}

class MoodsLoadingState extends MoodsState {
  MoodsState state;
  MoodsLoadingState(this.state) : super(state.moods, state.message);
}

class MoodsLoadedState extends MoodsState {
  MoodsState state;
  MoodsLoadedState(Map<String, Mood> moods, this.state)
      : super(moods, state.message);
}

class MoodsErrorState extends MoodsState {
  MoodsState state;
  MoodsErrorState(String message, this.state) : super(state.moods, message);
}

class MoodNotificationState extends MoodsState {
  MoodsState state;
  MoodNotificationState(String message, this.state)
      : super(state.moods, message);
}
