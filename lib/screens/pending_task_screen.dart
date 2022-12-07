import 'package:flutter/material.dart';

import '../models/task.dart';
import '../blocs/blocs.dart';

import '../widgets/task_list.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);

  static const id = 'pending_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Scaffold(
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Chip(
                label: Text("${state.pendingTask.length} Pending Tasks"),
              ),
            ),
            TaskList(taskList: taskList)
          ]),
        );
      },
    );
  }
}
