// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mia/models/models.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallBack;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallBack;
  final VoidCallback restoreTaskCallBack;
  final Task task;

  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallBack,
    required this.likeOrDislike,
    required this.editTaskCallBack,
    required this.restoreTaskCallBack,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    onTap: editTaskCallBack,
                    child: TextButton.icon(
                      onPressed: editTaskCallBack,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: likeOrDislike,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark),
                      label: task.isFavorite == false
                          ? const Text('Add to Bookmarks')
                          : const Text("Remove from Bookmarks"),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallBack,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    onTap: restoreTaskCallBack,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallBack,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever'),
                    ),
                  ),
                ]);
  }
}
