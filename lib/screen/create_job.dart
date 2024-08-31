import 'package:dio_api/network_manager/repositry.dart';
import 'package:flutter/material.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  bool loading=false;
  TextEditingController name=TextEditingController();
  TextEditingController job =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Job'),
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
              Repositry().jobapi(parems).then((value) {
                setState(() {
                  loading=false;
                });
                print("ID:${value.id} || ${value.name} || ${value.job}");
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
