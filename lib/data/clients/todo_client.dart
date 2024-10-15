import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '/data/data.dart';


abstract class IClient{
  Future<List<Todo>> getTodos();
}

@LazySingleton(as: IClient)
class TodoClient extends IClient {

  final http.Client httpClient;
  TodoClient(this.httpClient);




  @override
  Future<List<Todo>> getTodos() async{
    final urlTodos = Uri.https('jsonplaceholder.typicode.com','todos');

    final response = await httpClient.get(urlTodos,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    final responseBody = response.body;

    final List decodedBody = jsonDecode(responseBody);

    final iterable = decodedBody.map((e)=> Todo.fromJson(e));

    final listTodos = List<Todo>.from(iterable);

    if(response.statusCode == 200){

      return listTodos;
      
    }else{
      throw Exception(
        'Veriler Alınamadı. Hata Kodu: ${response.statusCode}',
      );
    }
  }
}





 