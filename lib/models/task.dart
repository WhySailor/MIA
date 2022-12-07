// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MiniList extends Equatable {
  final String? task;

  bool? isDone;

  MiniList({
    this.task,
    this.isDone,
  }) {
    isDone = isDone ?? false;
  }

  MiniList copyWith({
    String? task,
    bool? isDone,
  }) {
    return MiniList(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
      'isDone': isDone,
    };
  }

  factory MiniList.fromMap(Map<String, dynamic> map) {
    return MiniList(
      task: map['task'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        task,
        isDone,
      ];
}

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;

  List<MiniList> list;

  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.list = const [],
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    List<MiniList>? list,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      list: this.list,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'list': list.map((x) => x.toMap()).toList(),
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
      list: List<MiniList>.from(map['list']?.map((x) => MiniList.fromMap(x))),
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        id,
        date,
        list,
        isDone,
        isDeleted,
        isFavorite,
      ];
}
