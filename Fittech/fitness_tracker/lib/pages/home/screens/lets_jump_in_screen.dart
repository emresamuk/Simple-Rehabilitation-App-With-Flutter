import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/pages/home/screens/home_page.dart';
import 'package:flutter/material.dart';

class letsJumpInScreen extends StatelessWidget {
  const letsJumpInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 224, 225),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Best Workouts\nFor You",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50),
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login_screen_photo.png"),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: TwoColoredButton(
                color1: Color(0xFF01FFF0),
                color2: Color(0xFFF15223),
                text: "Let's Jump In",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  userProperties();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void userProperties() async {
    User? user = FirebaseAuth.instance.currentUser;
    final firestoreRef =
        FirebaseFirestore.instance.collection('user-properties').doc();
    await firestoreRef.set({
      'Age': sabitler.Age,
      'Gender': sabitler.Gender,
      'Weight': sabitler.Weight,
      'Height': sabitler.Height,
      'UserId': user!.uid.toString(),
    }, SetOptions(merge: true));
  }
}

class TwoColoredButton extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String text;
  final VoidCallback onPressed;

  const TwoColoredButton({
    required this.color1,
    required this.color2,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
