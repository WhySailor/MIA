part of 'theme_switch_bloc.dart';

abstract class ThemeSwitchEvent extends Equatable {
  const ThemeSwitchEvent();

  @override
  List<Object> get props => [];
}

class ThemeSwitchOnEvent extends ThemeSwitchEvent {}

class ThemeSwitchOffEvent extends ThemeSwitchEvent {}
