

import 'package:dio/dio.dart';
import '../utils/print_value.dart';

Dio getdio(){

  Dio dio=Dio();

  dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          printValue(tag: "API URL","${options.uri}");
          printValue(tag: "HEADER","${options.headers}");
          printValue(tag: "REQUEST BODY","${options.uri}");
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          printValue(tag: "API Response",response.data);
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          printValue(tag: "STATUS CODE","${e.response?.statusCode??""}");
          printValue(tag: "API URL",e.response?.data??"");
          if(e.response?.statusCode==401){
            print('Server Error');
          }else if(e.response?.statusCode==400){

          }
          return handler.next(e);
        },
      )
  );
  return dio;
}