import 'package:flutter/material.dart';
import 'package:template_project/register_page.dart';
import 'package:providers/provider.dart';
import 'providers/aut_provider.dart';
import 'splash_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/signIn': (context) => SignInScreen(),
          '/signUp': (context) => SignUpScreen(),
        },
      ),
    );
  }
}