part of 'todo_bloc.dart';

@immutable 

sealed class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoadInProgress extends TodoState {}

class TodoLoadSuccess extends TodoState {
  final List<Todo> todos;
  TodoLoadSuccess({required this.todos});
}

class TodoLoadFailure extends TodoState{
  final String error;
  TodoLoadFailure({required this.error});
}

