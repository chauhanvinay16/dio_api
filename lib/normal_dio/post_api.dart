import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  bool loding=false;


  @override
  void initState() {

  }

  login(String email, String password)async{
    setState(() {
      loding = true;
    });
    try{
      Dio dio=Dio();
      var response= await dio.post('https://reqres.in/api/login',
        data: {
          "email": email,
          "password": password
        }
      );
      if(response.statusCode==200){
        var data=response.data;
        setState(() {
          loding = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Login Succesfull',style: TextStyle(color: Colors.white),),
          ),
        );
        print("API RESPONSE==>${data}");
        return data;
      }
    }catch(e){
      print("Error==>${e.toString()}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post API'),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'Email'
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: pass,
            decoration: InputDecoration(
                hintText: 'password'
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            login(
                email.text.toString(),
                pass.text.toString()
            );
          }, child: loding?Center(child: CircularProgressIndicator(),):
          Text('Login'))
        ],
      ),
    );
  }
}
