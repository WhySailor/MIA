import 'package:flutter/material.dart';

import '../blocs/task/tasks_bloc.dart';
import '../screens/add_task_screen.dart';
import '../services/dark_theme.dart';

void _addTask(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskScreen(),
            ),
          ));
}

SingleChildScrollView topTaskCard(
    ScrollController scrollController, TasksState state, BuildContext context) {
  return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border:
                        Border.all(width: 2, color: const Color(0xffffa5a9)),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: const Icon(Icons.work_history_outlined)),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(size: 30, Icons.arrow_back_ios)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "${state.pendingTask.length} remaining",
                    style: const TextStyle(
                        fontFamily: "K2D",
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(size: 30, Icons.arrow_forward_ios)),
              ],
            ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              elevation: 2,
              color: customPrimaryColor,
              child: InkWell(
                onTap: (() => _addTask(context)),
                child: Container(
                    width: 40,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: const Icon(Icons.add_task_outlined)),
              ),
            )
          ],
        ),
      ));
}
