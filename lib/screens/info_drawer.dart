import 'package:flutter/material.dart';
import 'package:mia/screens/bin_screen.dart';
import 'package:mia/screens/tabs_screen.dart';

import '../blocs/blocs.dart';

class InfoDrawer extends StatelessWidget {
  const InfoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TabsScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text(
                        "${state.pendingTask.length} | ${state.completedTask.length}"),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    BinScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text("${state.deletedTask.length}"),
                  ),
                );
              },
            ),
            BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context
                              .read<ThemeSwitchBloc>()
                              .add(ThemeSwitchOnEvent())
                          : context
                              .read<ThemeSwitchBloc>()
                              .add(ThemeSwitchOffEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
