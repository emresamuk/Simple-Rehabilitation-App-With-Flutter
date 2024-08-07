import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_tracker/pages/home/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WelcomeScreen(),
      )
    );
  }

}

