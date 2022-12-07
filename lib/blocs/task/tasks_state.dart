part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> favoriteTask;
  final List<Task> deletedTask;
  const TasksState(
      {this.pendingTask = const <Task>[],
      this.deletedTask = const <Task>[],
      this.completedTask = const <Task>[],
      this.favoriteTask = const <Task>[]});

  @override
  List<Object> get props =>
      [pendingTask, deletedTask, completedTask, favoriteTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': pendingTask.map((x) => x.toMap()).toList(),
      'deletedTasks': deletedTask.map((x) => x.toMap()).toList(),
      'completedTasks': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTask: List<Task>.from(
        (map['allTasks']?.map((x) => Task.fromMap(x))),
      ),
      deletedTask: List<Task>.from(
        (map['deletedTasks']?.map((x) => Task.fromMap(x))),
      ),
      completedTask: List<Task>.from(
        (map['completedTasks']?.map((x) => Task.fromMap(x))),
      ),
      favoriteTask: List<Task>.from(
        (map['favoriteTasks']?.map((x) => Task.fromMap(x))),
      ),
    );
  }
}
