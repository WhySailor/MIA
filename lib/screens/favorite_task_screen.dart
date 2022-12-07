import 'package:flutter/material.dart';

import '../models/task.dart';
import '../blocs/blocs.dart';

import '../widgets/task_list.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({Key? key}) : super(key: key);

  static const id = 'favorite_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTask;
        return Scaffold(
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Chip(
                label: Text("${state.favoriteTask.length} Favorites"),
              ),
            ),
            TaskList(taskList: taskList)
          ]),
        );
      },
    );
  }
}
