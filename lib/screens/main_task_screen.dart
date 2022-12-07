import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

import '../models/task.dart';
import '../blocs/blocs.dart';

import '../widgets/task_list.dart';

import '../services/dark_theme.dart';
import '../widgets/top_task_card.dart';

class MainTaskScreen extends StatefulWidget {
  const MainTaskScreen({Key? key}) : super(key: key);

  static const id = 'main_task_screen';

  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> completedTaskList = state.completedTask;
        List<Task> pendingTaskList = state.pendingTask;
        return Scaffold(
          backgroundColor: customComplementaryColor[200],
          body: Stack(
            children: [
              BlocBuilder<AnimsBloc, AnimsState>(
                builder: (context, state) {
                  return Center(
                    child: ImageSequenceAnimator(
                      "assets/animations/${state.anims.animName}",
                      "unscreen-",
                      1,
                      3,
                      "png",
                      state.anims.animFrame,
                      fps: 30,
                      isBoomerang: true,
                    ),
                  );
                },
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  maxChildSize: 0.6,
                  minChildSize: 0.2,
                  snapSizes: const [0.2, 0.4, 0.6],
                  snap: true,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Card(
                      elevation: 2,
                      color: Colors.grey[100],
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            topTaskCard(scrollController, state, context),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 2,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TaskList(taskList: pendingTaskList),
                                    const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      thickness: 2,
                                      color: Colors.grey,
                                    ),
                                    TaskList(taskList: completedTaskList),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}
