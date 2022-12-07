import 'package:flutter/material.dart';
import 'package:mia/services/dark_theme.dart';
import 'package:mia/widgets/popup_menu.dart';

import '../blocs/blocs.dart';
import '../models/task.dart';
import '../screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDelete(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(FinalDeleteTask(task: task))
        : ctx.read<TasksBloc>().add(DeleteTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 4,
              width: MediaQuery.of(context).size.width - 25,
              child: LinearProgressIndicator(
                color: const Color.fromARGB(255, 152, 225, 155),
                backgroundColor: customPrimaryColor.shade100,
                value: 0.8,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.factory_outlined,
                      color: Colors.black87,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            task.title,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                decoration: task.isDone!
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              width: 150,
                              child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  task.description),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 120,
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      child: ClipPath(
                        clipper: BookmarkClipper(),
                        child: Container(
                          height: 50,
                          width: 70,
                          color: customPrimaryColor.shade200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: IconButton(
                                color: task.isFavorite == false
                                    ? Colors.black87
                                    : Colors.red.shade400,
                                onPressed: () => context.read<TasksBloc>().add(
                                    MarkFavoriteOrUnfavoriteTask(task: task)),
                                icon: task.isFavorite == false
                                    ? const Icon(Icons.bookmark_add_outlined)
                                    : const Icon(Icons.bookmark_rounded)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: CustomPaint(
                        painter: BoxShadowPainter(),
                        child: ClipPath(
                          clipper: TimerClipper(),
                          child: Container(
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              color: customComplementaryColor,
                            ),
                            child: const Icon(
                                size: 27, Icons.hourglass_empty_rounded),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TimerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TimerClipper oldClipper) => false;
}

class BookmarkClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.lineTo(size.width - 3, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 3);
    path.lineTo(size.width, size.height - 3);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 3, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BookmarkClipper oldClipper) => false;
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.moveTo(20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 20, size.height);

    path.close();

    canvas.drawShadow(path, Colors.black45, 4.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
