import 'package:dio_api/network_manager/repositry.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true, // Hides the password input
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });

                Map<String, String> params = {
                  "username": usernameController.text.trim(),
                  "password": passwordController.text.trim(),
                };

                try {
                  final response = await Repositry().login(params);
                  setState(() {
                    loading = false;
                  });

                  if (response != null && response is Map<String, dynamic>) {
                    print("Response: ${response['message']}");
                  } else {
                    print("Error: Unexpected response format or null response");
                  }
                } catch (error) {
                  setState(() {
                    loading = false;
                  });
                  print("Error==>${error.toString()}");
                }
              },
              child: loading
                  ? Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
                  : Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
