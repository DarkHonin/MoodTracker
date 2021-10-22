import 'package:equatable/equatable.dart';

import 'package:mood_tracker/models/mood.dart';

class MoodStoreEntity extends Equatable {
  final Map<String, Mood> moods;

  const MoodStoreEntity(this.moods);

  @override
  List<Object?> get props => [moods];

  MoodStoreEntity copyWith({
    Map<String, Mood>? moods,
  }) {
    return MoodStoreEntity(
      moods ?? this.moods,
    );
  }
}
