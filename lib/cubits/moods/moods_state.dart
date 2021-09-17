part of './moods_cubit.dart';

class MoodsState {
  final List<Mood> moods;
  final String message;

  const MoodsState(this.moods, this.message);
}

class MoodsLoadingState extends MoodsState {
  MoodsState state;
  MoodsLoadingState(this.state) : super(state.moods, state.message);
}

class MoodsLoadedState extends MoodsState {
  MoodsState state;
  MoodsLoadedState(List<Mood> moods, this.state) : super(moods, state.message);
}

class MoodsErrorState extends MoodsState {
  MoodsState state;
  MoodsErrorState(String message, this.state) : super(state.moods, message);
}
