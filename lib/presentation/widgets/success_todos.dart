import 'package:flutter/material.dart';

import '/data/data.dart';

class SuccessTodos extends StatelessWidget {
  ///
  const SuccessTodos({
    super.key,
    required this.todos,
  });

  ///
  final List<Todo>? todos;

  @override
  Widget build(BuildContext context) {
    ///
    return ListView.builder(
      itemCount: todos?.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        ///
        return Card(
          elevation: 4.0,
          child: ListTile(
            leading: Text(
              'Id: ${todos?[index].id}',
            ),
            title: Text(
              'Title: ${todos?[index].title}',
            ),
            subtitle: Text(
              'Completed: ${todos?[index].completed}',
            ),
            trailing: Text(
              'userId: ${todos?[index].userId}',
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(
        10.0,
      ),
    );
  }
}
