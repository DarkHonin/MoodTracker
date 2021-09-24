import 'package:equatable/equatable.dart';
import 'package:mood_tracker/models/mood_point.dart';

class Mood extends Equatable {
  final String name;
  final List<MoodPoint> points;
  const Mood(this.name, this.points);

  @override
  List<Object?> get props => [name, points];

  Map<String, dynamic> toMap() =>
      {'name': name, 'points': points.map((e) => e.toMap()).toList()};

  factory Mood.fromJson(Map<String, dynamic> json) {
    List<dynamic> prePoints = json['points'] ?? [];
    List<MoodPoint> points = prePoints.map((v) {
      return MoodPoint.fromMap(v);
    }).toList();
    return Mood(json['name'], points);
  }
}
