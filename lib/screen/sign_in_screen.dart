import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password?"),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign In"),
            ),
            SizedBox(height: 20),
            Text("or sign in with"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata, size: 40),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook, size: 40),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signUp");
              },
              child: Text("Don't have an account? Sign Up Now"),
            ),
          ],
        ),
      ),
    );
  }
}