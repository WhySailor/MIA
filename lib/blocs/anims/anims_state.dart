// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'anims_bloc.dart';

class AnimsState extends Equatable {
  final MiaAnims anims;
  const AnimsState({
    required this.anims,
  });

  @override
  List<Object> get props => [anims];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'anims': anims.toMap(),
    };
  }

  factory AnimsState.fromMap(Map<String, dynamic> map) {
    return AnimsState(
      anims: MiaAnims.fromMap(map['anims'] as Map<String, dynamic>),
    );
  }
}

class AnimsInitial extends AnimsState {
  const AnimsInitial()
      : super(anims: const MiaAnims(animName: 'idle', animFrame: 150));
}
