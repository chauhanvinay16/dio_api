
import 'package:dio_api/network_manager/dio_healper.dart';

import '../modal/create_job_modal.dart';
import '../modal/image_modal.dart';
import '../modal/list_modal.dart';
import '../modal/map_modal.dart';
import '../modal/put_modal.dart';

class Repositry{

  static final DioHealper _dioHealper=DioHealper();

  Future<MapModal >getapiMap()async{
    Map<String, dynamic>response= await _dioHealper.get(url: 'https://reqres.in/api/users?page=2',);
    return MapModal.fromJson(response);
  }

  Future<List<ListModal>>getlistapi()async{
    List<dynamic>response=await _dioHealper.get(url: 'https://jsonplaceholder.typicode.com/photos');
    return List<ListModal>.from(response.map((e)=>ListModal.fromJson(e)));
  }

  Future<CreateJobModal >jobapi(Object requestBody)async{
    Map<String,dynamic>response=await _dioHealper.post(url: 'https://reqres.in/api/users',requestBody: requestBody);
    return CreateJobModal.fromJson(response);
  }

  Future<dynamic>login(Object requestBody)async{
    Map<String,dynamic>response=await _dioHealper.post(url: 'https://dummyjson.com/auth/login',requestBody: requestBody);
    return response;
  }

  Future<PutModal>putapi(Object requestBody,String id)async{
    Map<String,dynamic>response=await _dioHealper.put(url: 'https://reqres.in/api/users/$id',requestBody: requestBody);
    return PutModal .fromJson(response);
  }

  Future<dynamic>putapiwithoutmodal(Object requestBody,String id)async{
    Map<String,dynamic>response=await _dioHealper.put(url: 'https://reqres.in/api/users/$id',requestBody: requestBody);
    return response;
  }

  Future<dynamic>deleteapi(String id)async{
    var response=await _dioHealper.put(url: 'https://api.escuelajs.co/api/v1/products/$id');
    return response;
  }

  Future<UploadModal>uploadapi(Object requestBody)async{
    Map<String,dynamic>response=await _dioHealper.uploadfile(url: 'https://api.escuelajs.co/api/v1/files/upload',requestBody: requestBody);
    return UploadModal .fromJson(response);
  }
}