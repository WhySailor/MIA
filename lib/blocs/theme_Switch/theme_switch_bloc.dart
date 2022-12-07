import '../blocs.dart';
import 'package:equatable/equatable.dart';

part 'theme_switch_event.dart';
part 'theme_switch_state.dart';

class ThemeSwitchBloc extends HydratedBloc<ThemeSwitchEvent, ThemeSwitchState> {
  ThemeSwitchBloc() : super(const ThemeSwitchInitial(switchValue: false)) {
    on<ThemeSwitchOnEvent>(((event, emit) {
      emit(const ThemeSwitchState(switchValue: true));
    }));
    on<ThemeSwitchOffEvent>(((event, emit) {
      emit(const ThemeSwitchState(switchValue: false));
    }));
  }

  @override
  ThemeSwitchState? fromJson(Map<String, dynamic> json) {
    return ThemeSwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeSwitchState state) {
    return state.toMap();
  }
}
