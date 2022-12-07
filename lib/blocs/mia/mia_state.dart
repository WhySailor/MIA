// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'mia_bloc.dart';

class MiaState extends Equatable {
  final Mia mia;

  const MiaState({required this.mia});

  @override
  List<Object> get props => [mia];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mia': mia.toMap(),
    };
  }

  factory MiaState.fromMap(Map<String, dynamic> map) {
    return MiaState(
      mia: Mia.fromMap(map['mia'] as Map<String, dynamic>),
    );
  }
}

class MiaInitial extends MiaState {
  const MiaInitial() : super(mia: const Mia(mood: 50));
}
