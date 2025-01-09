import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/messages_provider.dart';
import 'package:template_project/providers/user_provider.dart';
import 'package:template_project/screen/home_screen_layout.dart';
import 'package:template_project/screen/messages_screen.dart';
import 'providers/aut_provider.dart';
import 'screen/splash_screen.dart';
import 'screen/sign_in_screen.dart';
import 'screen/sign_up_screen.dart';
import 'screen/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MessageProvider()..loadMessages()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
