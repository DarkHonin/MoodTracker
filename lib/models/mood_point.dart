import 'package:equatable/equatable.dart';

class MoodPoint extends Equatable {
  final DateTime dateTime;
  final double value;

  const MoodPoint(this.dateTime, this.value);

  @override
  List<Object?> get props => [dateTime, value];

  factory MoodPoint.fromMap(Map<String, dynamic> map) {
    return MoodPoint(DateTime.fromMillisecondsSinceEpoch(map['time']), double.parse(map['value']));
  }

  Map<String, dynamic> toMap() {
    return {'time': dateTime.millisecondsSinceEpoch, 'value': value.toString()};
  }
}
