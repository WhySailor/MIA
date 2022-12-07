part of 'theme_switch_bloc.dart';

class ThemeSwitchState extends Equatable {
  final bool switchValue;
  const ThemeSwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory ThemeSwitchState.fromMap(Map<String, dynamic> map) {
    return ThemeSwitchState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

class ThemeSwitchInitial extends ThemeSwitchState {
  const ThemeSwitchInitial({required super.switchValue});
}
