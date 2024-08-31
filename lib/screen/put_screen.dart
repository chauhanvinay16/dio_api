import 'package:flutter/material.dart';

import '../network_manager/repositry.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({super.key});

  @override
  State<PutScreen> createState() => _PutScreenState();
}

class _PutScreenState extends State<PutScreen> {
  bool loading=false;
  TextEditingController name=TextEditingController();
  TextEditingController job =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUT API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  hintText: 'Name'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: job,
              decoration: InputDecoration(
                  hintText: 'Job'
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              setState(() {
                loading=true;
              });
              Map parems={
                "name": name.text.toString(),
                "job": job.text.toString(),
              };
              Repositry().putapi(parems,'2').then((value) {
                setState(() {
                  loading=false;
                });
                print("Job:${value.job} || ${value.name} ");
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
