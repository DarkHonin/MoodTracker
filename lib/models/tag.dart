import 'dart:convert';

class Tag {
  DateTime dateTime;
  String value;
  Tag({
    required this.dateTime,
    required this.value,
  });

  Tag copyWith({
    DateTime? dateTime,
    String? value,
  }) {
    return Tag(
      dateTime: dateTime ?? this.dateTime,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.millisecondsSinceEpoch,
      'value': value,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) => Tag.fromMap(json.decode(source));

  @override
  String toString() => 'Tag(dateTime: $dateTime, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tag && other.dateTime == dateTime && other.value == value;
  }

  @override
  int get hashCode => dateTime.hashCode ^ value.hashCode;
}
