import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/about_screen.dart';
import 'models/user.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({Key? key}) : super(key: key);

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  bool _isDark = false;

  final User user = User(
    name: 'Saima Ali',
    profession: 'DevOps Engineer',
    bio:
        'I’m a DevOps Engineer at Core Elite Experts, passionate about automating development workflows and bridging the gap between code and infrastructure.',
    email: 'saima.devops@example.com',
    phone: '+92 333 1234567',
    location: 'Gilgit, Pakistan',
    imagePath: 'assets/images/profile.jpg',
    linkedin: 'https://linkedin.com/in/saimaali',
    github: 'https://github.com/saimaali',
    twitter: 'https://twitter.com/saimaali',
    skills: [
      'CI/CD (Jenkins, GitHub Actions)',
      'Docker & Docker Compose',
      'AWS (EC2, S3)',
      'React.js',
      'Node.js',
      'Python',
    ],
    hobbies: [
      'Learning new DevOps tools',
      'Coding',
      'Blogging',
      'Music',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(
              isDark: _isDark,
              toggleTheme: (v) => setState(() => _isDark = v),
              onViewProfile: () {
                Navigator.pushNamed(context, '/profile', arguments: user);
              },
            ),
        '/profile': (context) {
          final u = ModalRoute.of(context)!.settings.arguments as User;
          return ProfileScreen(user: u);
        },
        '/about': (context) {
          final u = ModalRoute.of(context)!.settings.arguments as User;
          return AboutScreen(user: u);
        },
      },
    );
  }
}
