import 'package:fancy_popups_new/fancy_popups_new.dart';
import 'package:flutter/material.dart';

import '../network_manager/repositry.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  bool loading=false;
  TextEditingController id=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: id,
              decoration: InputDecoration(
                  hintText: 'id'
              ),
            ),

            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              setState(() {
                loading=true;
              });

              Repositry().deleteapi(id.text.toString()).then((value) {
                setState(() {
                  loading=false;
                });
                print("ID:${value['id']}");
                print('Product Delete Successfull');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product Delete Successfull'),
                  ),
                );
              },).onError((error, stackTrace) {
                print("Error:${error.toString()}");
              },);
            }, child: loading ? Center(child: CircularProgressIndicator(color: Colors.green,),):
            Text('Submit'))
          ],
        ),
      ),
    );
  }
}
