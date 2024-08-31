import 'package:dio_api/modal/list_modal.dart';
import 'package:dio_api/network_manager/repositry.dart';
import 'package:flutter/material.dart';

class ListApi extends StatefulWidget {
  const ListApi({super.key});

  @override
  State<ListApi> createState() => _ListApiState();
}

class _ListApiState extends State<ListApi> {
  bool loading=true;
  List<ListModal> listModal=[];

  @override
  void initState() {
    // TODO: implement initState
    getlist();
  }

  getlist(){
    Repositry().getlistapi().then((value) {
      listModal=value;
      loading=false;
      setState(() {});
    },).onError((error, stackTrace) {
      print("Error==>${error.toString()}");
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List API'),
      ),
      body: loading?Center(child: CircularProgressIndicator(color: Colors.red,),):
      ListView.builder(
          itemCount: listModal.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(listModal[index].thumbnailUrl??""),
              ),
              title: Text("Title:${listModal[index].title.toString()}"),
              subtitle: Text("AlbumId:${listModal[index].id.toString()}"),
            );
          },
      ),
    );
  }
}
