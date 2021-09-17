import 'package:equatable/equatable.dart';

class Mood extends Equatable {
  final String name;

  const Mood(this.name);

  @override
  List<Object?> get props => [name];

  Map<String, dynamic> toJson() => {'name': name};

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(json['name']);
  }
}
