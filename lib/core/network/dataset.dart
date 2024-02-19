import 'package:dio/dio.dart';
abstract class DataSet<T>{
  final T? data;
  final DioException? exception;
  DataSet({this.data, this.exception});
}

class DataSuccess<T> extends DataSet<T>{
  DataSuccess(T? data):super(data: data);
}

class DataFailed<T> extends DataSet<T>{
  DataFailed(DioException? ex):super(exception: ex);
}

