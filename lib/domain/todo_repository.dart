import 'package:injectable/injectable.dart';

import '../data/data.dart';

abstract class ITodoRepository{
  Future<List<Todo>> getTodos();
}

@LazySingleton(as: ITodoRepository)
class TodoRepository implements ITodoRepository{

  final IClient todoClient;

  TodoRepository(this.todoClient);

  @override
  Future<List<Todo>> getTodos ()async => await todoClient.getTodos();
  
}