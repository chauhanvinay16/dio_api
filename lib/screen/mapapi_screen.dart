import 'package:dio_api/modal/map_modal.dart';
import 'package:dio_api/network_manager/repositry.dart';
import 'package:flutter/material.dart';

class MapapiScreen extends StatefulWidget {
  const MapapiScreen({super.key});

  @override
  State<MapapiScreen> createState() => _MapapiScreenState();
}

class _MapapiScreenState extends State<MapapiScreen> {
  MapModal mapModal=MapModal();
  bool loading=false;

  getdata(){
    loading=true;
    Repositry().getapiMap().then((value) {
      mapModal=value;
      loading=false;
      setState(() {
        
      });
    },).onError((error, stackTrace) {
      print("Error==>${error.toString()}");
    },);
  }

  @override
  void initState() {
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map API'),
      ),
      body: loading ? Center(child: CircularProgressIndicator(),):
      ListView.builder(
          itemCount: mapModal.data?.length??0,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(mapModal.data?[index].avatar??""),
              ),
              title: Text('F-Name:${mapModal.data?[index].firstName} L-Name-${mapModal.data?[index].lastName}'),
            );
          },
      ),
    );
  }
}
