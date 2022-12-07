import 'package:flutter/material.dart';

import '../models/task.dart';
import '../blocs/blocs.dart';

import '../widgets/task_list.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  static const id = 'completed_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTask;
        return Scaffold(
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Chip(
                label: Text("${state.completedTask.length} Completed"),
              ),
            ),
            TaskList(taskList: taskList)
          ]),
        );
      },
    );
  }
}
