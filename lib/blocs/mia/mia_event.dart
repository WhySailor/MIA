// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'mia_bloc.dart';

abstract class MiaEvent extends Equatable {
  const MiaEvent();

  @override
  List<Object> get props => [];
}

class UpdateMiaMood extends MiaEvent {
  final Mia mia;
  const UpdateMiaMood({
    required this.mia,
  });
}

class DecreaseMiaMood extends MiaEvent {
  final Mia mia;
  final DateTime date;
  const DecreaseMiaMood({
    required this.mia,
    required this.date,
  });
}
