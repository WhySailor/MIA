// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MiaAnims extends Equatable {
  final String animName;
  final double animFrame;

  const MiaAnims({
    required this.animName,
    required this.animFrame,
  });

  MiaAnims copyWith({
    String? animName,
    double? animFrame,
  }) {
    return MiaAnims(
      animName: animName ?? this.animName,
      animFrame: animFrame ?? this.animFrame,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'animName': animName,
      'animFrame': animFrame,
    };
  }

  factory MiaAnims.fromMap(Map<String, dynamic> map) {
    return MiaAnims(
      animName: map['animName'] as String,
      animFrame: map['animFrame'] as double,
    );
  }

  @override
  List<Object?> get props => [animName, animFrame];
}
