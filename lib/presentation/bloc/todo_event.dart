part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class TodoFetched extends TodoEvent {}