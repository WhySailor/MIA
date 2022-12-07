import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:equatable/equatable.dart';

import '../blocs.dart';
import 'package:mia/models/mia.dart';

part 'mia_event.dart';
part 'mia_state.dart';

class MiaBloc extends HydratedBloc<MiaEvent, MiaState> {
  MiaBloc() : super(const MiaInitial()) {
    on<UpdateMiaMood>(_onUpdateMiaMood);
    on<DecreaseMiaMood>(_onDecreaseMiaMood);
  }

  void _onDecreaseMiaMood(DecreaseMiaMood event, Emitter<MiaState> emit) {}

  void _onUpdateMiaMood(UpdateMiaMood event, Emitter<MiaState> emit) {
    final state = this.state;

    emit(MiaState(
      mia: state.mia.copyWith(mood: state.mia.mood + 1),
    ));
  }

  @override
  MiaState? fromJson(Map<String, dynamic> json) {
    return MiaState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(MiaState state) {
    return state.toMap();
  }
}
