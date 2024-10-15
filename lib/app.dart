import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'presentation/presentation.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final todoBloc = getIt<TodoBloc>();

    return BlocProvider<TodoBloc>(
      create: (context)=>todoBloc,
      
      child: const MaterialApp(
        home: TodoView(),
      ),
    );
  }
}
