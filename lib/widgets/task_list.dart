import 'package:flutter/material.dart';
import 'package:mia/blocs/blocs.dart';
import 'package:mia/services/dark_theme.dart';
import 'package:mia/widgets/task_tile.dart';
import '../models/task.dart';
import "dart:developer" as developper;

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    TextEditingController listTextController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ExpansionPanelList.radio(
        children: widget.taskList
            .map(
              (task) => ExpansionPanelRadio(
                hasIcon: false,
                canTapOnHeader: true,
                value: task.id,
                headerBuilder: (context, isOpen) => Dismissible(
                  key: Key(task.id),
                  secondaryBackground: Container(
                    color: const Color.fromARGB(255, 148, 221, 151),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Icon(Icons.check),
                        ),
                      ],
                    ),
                  ),
                  background: Container(
                    color: const Color.fromARGB(255, 230, 105, 89),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                  onDismissed: (direction) => direction ==
                          DismissDirection.endToStart
                      ? context.read<TasksBloc>().add(UpdateTask(task: task))
                      : context.read<TasksBloc>().add(DeleteTask(task: task)),
                  child: TaskTile(task: task),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: SelectableText.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2),
                            ),
                          ])),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 10),
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                                color: customPrimaryColor.shade50,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectableText.rich(
                                  TextSpan(text: task.description)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: SelectableText.rich(TextSpan(children: [
                            TextSpan(
                              text: 'List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2),
                            ),
                          ])),
                        ),
                        Column(
                            children: task.list
                                .map((list) => (Row(
                                      children: [
                                        Checkbox(
                                            value: list.isDone,
                                            onChanged: (value) {
                                              setState(() {
                                                context.read<TasksBloc>().add(
                                                    UpdateTaskList(
                                                        task: task,
                                                        list: list));
                                              });
                                            }),
                                        Text(list.task!),
                                      ],
                                    )))
                                .toList()),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0, right: 8, bottom: 8),
                          child: Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: 40,
                                  child: TextField(
                                    autofocus: false,
                                    controller: listTextController,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                        label: Text("Task"),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    elevation: 2,
                                    color: customPrimaryColor,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          context.read<TasksBloc>().add(
                                                AddTaskList(
                                                  task: task,
                                                  list: MiniList(
                                                      task: listTextController
                                                          .text),
                                                ),
                                              );

                                          developper.log(task.toString());
                                        });
                                      },
                                      child: Container(
                                          width: 40,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          child: const Icon(
                                              Icons.list_alt_rounded)),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}



/*   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ExpansionPanelList.radio(
        children: taskList
            .map(
              (task) => ExpansionPanelRadio(
                hasIcon: false,
                canTapOnHeader: true,
                value: task.id,
                headerBuilder: (context, isOpen) => TaskTile(task: task),
                body: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${task.title}\n'),
                      const TextSpan(
                        text: 'Description\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${task.description}\n')
                    ])),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
 */