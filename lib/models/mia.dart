// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Mia extends Equatable {
  final double mood;

  const Mia({required this.mood});

  Mia copyWith({
    double? mood,
  }) {
    return Mia(
      mood: mood ?? this.mood,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mood': mood,
    };
  }

  factory Mia.fromMap(Map<String, dynamic> map) {
    return Mia(
      mood: map['mood'] as double,
    );
  }

  @override
  List<Object?> get props => [mood];
}
