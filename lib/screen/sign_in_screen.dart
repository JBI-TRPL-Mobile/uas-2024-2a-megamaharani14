import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   bool _obscureTextPassword = true;

 void _signIn(BuildContext context) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  // Memuat data pengguna dari JSON (jika belum dimuat)
  await userProvider.loadUserData();

  final email = _emailController.text;
  final password = _passwordController.text;

  if (userProvider.login(email, password)) {
    // Login berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login Successful")),
    );

    // Arahkan ke halaman berikutnya
    Navigator.pushNamed(context, "/home");
  } else {
    // Login gagal
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid email or password")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"), backgroundColor: Colors.blueAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
                controller: _passwordController,
                obscureText: _obscureTextPassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextPassword = !_obscureTextPassword;
                      });
                    },
                  ),
                ),
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
              onPressed: () => _signIn(context),
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
