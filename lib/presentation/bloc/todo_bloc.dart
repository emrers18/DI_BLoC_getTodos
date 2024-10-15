import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '/data/data.dart';
import '/domain/domain.dart';

part 'todo_state.dart';
part 'todo_event.dart';

@injectable 
class TodoBloc extends Bloc<TodoEvent,TodoState>{
  
  final ITodoRepository todoRepository;

  TodoBloc({required this.todoRepository}):super(TodoInitial()){
    on<TodoFetched>(
      (event, emit) async{
        emit(TodoLoadInProgress());

        try{
          final todos = await todoRepository.getTodos();

          emit(TodoLoadSuccess(todos: todos));
        }catch(e){
          emit(TodoLoadFailure(error: '$e'));
        }
        
      },
    );
  }
  
}