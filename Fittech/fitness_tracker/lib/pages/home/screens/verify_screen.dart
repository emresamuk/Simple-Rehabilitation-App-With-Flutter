import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/pages/home/screens/log_in_screen.dart';
import 'package:flutter/material.dart';

class verifyScreen extends StatelessWidget {
  const verifyScreen({Key? key});

  Future<void> sendVerificationEmail(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    } else if (user != null && user.emailVerified) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Your email is already verified.'),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('User is null or email is not verified.'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 224, 225),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "VERIFY ACCOUNT ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Click the button for verification link and look at your mailbox !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  sendVerificationEmail(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 319,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ],
                    color: Color.fromRGBO(1, 255, 239, 1),
                  ),
                  child: Text(
                    'Send Verification Link',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
