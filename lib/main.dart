import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stals_frontend/screens/signin.dart';
import 'package:stals_frontend/screens/signup.dart';
import 'package:stals_frontend/screens/homepage.dart';
import 'package:stals_frontend/screens/homepage_signed.dart';
import 'package:stals_frontend/screens/accomm.dart';

void main() {
  runApp(const MyApp());
  // Make app full screen
  // SystemChrome.setEnabledSystemUIMode(
  //     SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMSC 128 STALS',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'CMSC 128'),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/homepage': (context) => const UnregisteredHomepage(),
        '/signed_homepage': (context) => const RegisteredHomepage(),
        '/accomm': (context) => const AccommPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        ListTile(
          title: const Text('Sign In Page'),
          trailing: const Icon(Icons.person),
          onTap: () {
            Navigator.pushNamed(context, '/signin');
          },
        ),
        ListTile(
          title: const Text('Sign Up Page'),
          trailing: const Icon(Icons.person_search_sharp),
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
        ),
        ListTile(
          title: const Text('Unregistered Homepage'),
          trailing: const Icon(Icons.note_sharp),
          onTap: () {
            Navigator.pushNamed(context, '/homepage');
          },
        ),
        ListTile(
          title: const Text('Registered Homepage'),
          trailing: const Icon(Icons.home),
          onTap: () {
            Navigator.pushNamed(context, '/signed_homepage');
          },
        ),
        ListTile(
          title: const Text('Accommodation'),
          trailing: const Icon(Icons.construction),
          onTap: () {
            Navigator.pushNamed(context, '/accomm');
          },
        ),
        ListTile(
          title: const Text('Logout'),
          trailing: const Icon(Icons.logout),
          onTap: () {},
        ),
      ])),
      appBar: AppBar(
        title: const Text("CMSC 128 STALS"),
        backgroundColor: const Color.fromARGB(255, 67, 134, 221),
      ),
    );
  }
}
