// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mia/models/mia_anims.dart';

part 'anims_event.dart';
part 'anims_state.dart';

class AnimsBloc extends Bloc<AnimsEvent, AnimsState> {
  AnimsBloc() : super(const AnimsInitial()) {
    on<HandleAnims>(_onHandleAnims);
    on<SetIdle>(_onSetIdle);
  }

  void _onSetIdle(SetIdle event, Emitter<AnimsState> emit) {
    final state = this.state;
    emit(AnimsState(
        anims: state.anims.copyWith(animName: "idle", animFrame: 150)));
  }

  void _onHandleAnims(HandleAnims event, Emitter<AnimsState> emit) {
    final state = this.state;
    emit(AnimsState(
        anims: state.anims
            .copyWith(animName: event.animName, animFrame: event.animFrame)));
  }
}
