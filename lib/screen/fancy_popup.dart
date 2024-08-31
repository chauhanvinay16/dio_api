import 'package:fancy_popups_new/fancy_popups_new.dart';
import 'package:flutter/material.dart';

class FancyPopup extends StatefulWidget {
  const FancyPopup({super.key});

  @override
  State<FancyPopup> createState() => _FancyPopupState();
}

class _FancyPopupState extends State<FancyPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Fancy Popup"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Success!", body: "Uploading completed! Your file uploaded successfully.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.success,
                        buttonText: "Continue");
                  });
            }, child: const Text("Success Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Error!", body: "Uploading failed! Your file uploaded failed.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.error,
                        buttonText: "Go Back");
                  });
            }, child: const Text("Error Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "No Internet!", body: "No Internet Access Found.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.noInternet,
                        buttonText: "Recheck");
                  });
            }, child: const Text("No Internet Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Server Error!", body: "Server Got Error",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.serverError,
                        buttonText: "Exit");
                  });
            }, child: const Text("Server Error Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "API Timeout!", body: "Your API Got Timeout",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.timeout,
                        buttonText: "Continue");
                  });
            }, child: const Text("Timeout Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "No Search Results!", body: "No Search Results Found.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.search,
                        buttonText: "Continue");
                  });
            }, child: const Text("No Search Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Warning!", body: "Something went wrong.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.warning,
                        buttonText: "Continue");
                  });
            }, child: const Text("Warning Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Delete!", body: "Are you sure you want to delete.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.delete,
                        buttonText: "Yes");
                  });
            }, child: const Text("Delete Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "No Location Found!", body: "Location Access Not Detected.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.location,
                        buttonText: "Turn On");
                  });
            }, child: const Text("Location Dialog")),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
