import 'package:dio_api/network_manager/repositry.dart';
import 'package:dio_api/normal_dio/get_api.dart';
import 'package:dio_api/normal_dio/post_api.dart';
import 'package:dio_api/screen/create_job.dart';
import 'package:dio_api/screen/delete_screen.dart';
import 'package:dio_api/screen/fancy_popup.dart';
import 'package:dio_api/screen/list_api.dart';
import 'package:dio_api/screen/login_screen.dart';
import 'package:dio_api/screen/mapapi_screen.dart';
import 'package:dio_api/screen/put_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DeleteScreen(),
    );
  }
}

