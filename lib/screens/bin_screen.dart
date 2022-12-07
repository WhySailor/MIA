import 'package:flutter/material.dart';

import '../blocs/blocs.dart';
import '../widgets/task_list.dart';
import 'info_drawer.dart';

class BinScreen extends StatelessWidget {
  const BinScreen({super.key});

  static const id = "bin_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Recycle Bin"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          drawer: const InfoDrawer(),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Chip(
                label: Text("${state.deletedTask.length} Tasks"),
              ),
            ),
            TaskList(taskList: state.deletedTask)
          ]),
        );
      },
    );
  }
}
