import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appTitle: 'BlocBuilder',
      ),
      body: BlocBuilder<TodoBloc,TodoState>(
        builder: (context,state){
          if(state is TodoInitial){
            return const LoadingWidget(text: 'Başlangıç');
          }

          if(state is TodoLoadSuccess){
            return SuccessTodos(todos: state.todos);
          }

          if(state is TodoLoadFailure){
            return ApiErrorWidget(errorMessage: state.error);

          }

          return const LoadingWidget(text: 'Yükleniyor');
        }),
    );
  }
}