import 'package:equatable/equatable.dart';
import 'package:mia/models/task.dart';
import 'dart:developer' as developer;

import '../blocs.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<FinalDeleteTask>(_onFinalDeleteTask);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<AddTaskList>(_onAddTaskList);
    on<UpdateTaskList>(_onUpdateTaskList);
    on<RemoveTaskList>(_onRemoveTaskList);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTask: List.from(state.pendingTask)..add(event.task),
      deletedTask: state.deletedTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask = state.completedTask;
    task.isDone == false
        ? {
            pendingTask = List.from(pendingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pendingTask = List.from(pendingTask)
              ..insert(0, task.copyWith(isDone: false))
          };
    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: completedTask,
      favoriteTask: state.favoriteTask,
      deletedTask: state.deletedTask,
    ));
  }

  void _onAddTaskList(AddTaskList event, Emitter<TasksState> emit) {
    final state = this.state;
    Task task = event.task;
    final list = event.list;
    List<Task> pendingTask = state.pendingTask;
    task.list = [...task.list, list];
    pendingTask[pendingTask.indexWhere((element) => element.id == task.id)] =
        task;

    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      deletedTask: state.deletedTask,
    ));
  }

  void _onUpdateTaskList(UpdateTaskList event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    MiniList list = event.list;

    List<Task> pendingTask = state.pendingTask;
    List<MiniList> currentList = pendingTask[pendingTask.indexOf(task)].list;

    var listIndex = currentList.indexOf(list);
    var taskIndex = pendingTask.indexOf(task);
    developer.log(currentList[listIndex].isDone.toString());
    if (currentList[listIndex].isDone == false) {
      list.isDone = true;
    } else {
      list.isDone = false;
    }

    pendingTask = List.from(pendingTask)
      ..remove(task)
      ..insert(
          taskIndex,
          task.copyWith(
              list: List.from(currentList)
                ..remove(currentList[listIndex])
                ..insert(listIndex, list)));
    developer.log(pendingTask.toString());
    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      deletedTask: state.deletedTask,
    ));
  }

  void _onRemoveTaskList(RemoveTaskList event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final list = event.list;

    List<Task> pendingTask = state.pendingTask;
    List<MiniList> currentList = pendingTask[pendingTask.indexOf(task)].list;

    var taskIndex = pendingTask.indexOf(task);
    pendingTask = List.from(pendingTask)
      ..remove(task)
      ..insert(
          taskIndex, task.copyWith(list: List.from(currentList)..remove(list)));
    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      deletedTask: state.deletedTask,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTask: List.from(state.pendingTask)..remove(event.task),
        completedTask: List.from(state.completedTask)..remove(event.task),
        favoriteTask: List.from(state.favoriteTask)..remove(event.task),
        deletedTask: List.from(state.deletedTask)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTask: List.from(state.pendingTask)
        ..insert(
          0,
          event.task.copyWith(
            isDeleted: false,
            isFavorite: false,
            isDone: false,
          ),
        ),
      completedTask: List.from(state.completedTask)..remove(event.task),
      favoriteTask: List.from(state.favoriteTask)..remove(event.task),
      deletedTask: List.from(state.deletedTask)..remove(event.task),
    ));
  }

  void _onFinalDeleteTask(FinalDeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
          pendingTask: state.pendingTask,
          completedTask: state.completedTask,
          favoriteTask: state.favoriteTask,
          deletedTask: List.from(state.deletedTask)..remove(event.task)),
    );
  }

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> pendingTasks = state.pendingTask;
    List<Task> completedTasks = state.completedTask;
    List<Task> favoriteTasks = state.favoriteTask;

    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }
    emit(TasksState(
      pendingTask: pendingTasks,
      completedTask: completedTasks,
      favoriteTask: favoriteTasks,
      deletedTask: state.deletedTask,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> favoriteTasks = state.favoriteTask;
    if (event.oldTask.isFavorite == true) {
      favoriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TasksState(
      pendingTask: List.from(state.pendingTask)
        ..remove(event.oldTask)
        ..insert(0, event.newTask),
      completedTask: state.completedTask..remove(event.oldTask),
      favoriteTask: favoriteTasks,
      deletedTask: state.deletedTask,
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
