import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/user.dart';
import 'screens/welcome_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({Key? key}) : super(key: key);

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  User? user;
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final String response =
        await rootBundle.loadString('assets/data/user.json');
    final data = json.decode(response);
    setState(() {
      user = User.fromJson(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      // 🧠 FIX: Wrapped WelcomeScreen in Builder to provide correct Navigator context
      routes: {
        '/': (context) => Builder(
              builder: (context) => WelcomeScreen(
                onViewProfile: () {
                  if (user != null) {
                    Navigator.pushNamed(context, '/profile',
                        arguments: user);
                  }
                },
                toggleTheme: (v) => setState(() => isDark = v),
                isDark: isDark,
              ),
            ),
        '/profile': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as User?;
          return args == null
              ? const Scaffold(
                  body: Center(child: CircularProgressIndicator()))
              : ProfileScreen(user: args);
        },
        '/about': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as User?;
          return args == null
              ? const Scaffold(
                  body: Center(child: CircularProgressIndicator()))
              : AboutScreen(user: args);
        },
      },
    );
  }
}
