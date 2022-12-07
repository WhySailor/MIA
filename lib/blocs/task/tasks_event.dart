// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class AddTaskList extends TasksEvent {
  final Task task;
  final MiniList list;
  const AddTaskList({
    required this.task,
    required this.list,
  });

  @override
  List<Object> get props => [task, list];
}

class UpdateTaskList extends TasksEvent {
  final Task task;
  final MiniList list;
  const UpdateTaskList({
    required this.task,
    required this.list,
  });

  @override
  List<Object> get props => [task, list];
}

class RemoveTaskList extends TasksEvent {
  final Task task;
  final MiniList list;
  const RemoveTaskList({
    required this.task,
    required this.list,
  });

  @override
  List<Object> get props => [task, list];
}

class FinalDeleteTask extends TasksEvent {
  final Task task;
  const FinalDeleteTask({
    required this.task,
  });
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnfavoriteTask extends TasksEvent {
  final Task task;
  const MarkFavoriteOrUnfavoriteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class EditTask extends TasksEvent {
  final Task oldTask;
  final Task newTask;
  const EditTask({required this.oldTask, required this.newTask});

  @override
  List<Object> get props => [oldTask, newTask];
}

class RestoreTask extends TasksEvent {
  final Task task;
  const RestoreTask({required this.task});

  @override
  List<Object> get props => [task];
}
