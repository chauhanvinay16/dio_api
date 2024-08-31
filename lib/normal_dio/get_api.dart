import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  List _data = [];

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  _getdata() async {
    try {
      var dio = Dio();
      var response = await dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        var data = response.data;
        print("API RESPONSE==>$data");
        setState(() {
          _data = data;
        });
      }
    } catch (e) {
      print("Error==>${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Normal Code Api'),
      ),
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_data[index]['title']),
              subtitle: Text("completed:${_data[index]['completed']}"),
            ),
          );
        },
      ),
    );
  }
}