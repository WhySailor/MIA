part of 'anims_bloc.dart';

abstract class AnimsEvent extends Equatable {
  const AnimsEvent();

  @override
  List<Object> get props => [];
}

class HandleAnims extends AnimsEvent {
  final MiaAnims anims;
  final String animName;
  final double animFrame;

  const HandleAnims(
    this.anims,
    this.animName,
    this.animFrame,
  );
}

class SetIdle extends AnimsEvent {
  final MiaAnims anims;

  const SetIdle(this.anims);
}
