import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/home_screen_layout.dart';
import 'package:template_project/screen/messagesPage.dart';
import 'providers/aut_provider.dart';
import 'screen/splash_screen.dart';
import 'screen/sign_in_screen.dart';
import 'screen/sign_up_screen.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/signIn': (context) => SignInScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/messages': (context) => MessagesScreen(),
          '/home': (context) => HomeScreen(),
          '/profilePage': (context) => const ProfilePage(),
        },
      ),
    );
  }
}
