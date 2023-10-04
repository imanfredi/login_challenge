import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/todos.dart';

part 'todos_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class TodosRepository {
  factory TodosRepository(Dio dio, {String baseUrl}) = _TodosRepository;

  @GET("/todos")
  Future<List<Todos>> getTodos();
}
