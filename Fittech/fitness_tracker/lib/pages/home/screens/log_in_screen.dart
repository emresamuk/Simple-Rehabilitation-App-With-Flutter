import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/pages/home/screens/forgot_password_screen.dart';
import 'package:fitness_tracker/pages/home/screens/gender_page.dart';
import 'package:fitness_tracker/pages/home/screens/home_page.dart';
import 'package:fitness_tracker/pages/home/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'verify_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static String? Gender;
  static String? Age;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailLoginController = TextEditingController();
  final TextEditingController _passwordLoginController =
      TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseAuth auth;
  void navigateToRegisterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  Future<void> _loginUser() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailLoginController.text.trim(),
        password: _passwordLoginController.text.trim(),
      );

      User? user = userCredential.user;

      if (user != null) {
        // Handle your navigation here based on the complete profile
        if (user.emailVerified) {
          var userProperties =
              await _firestore.collection("user-properties").get();
          for (var user1 in userProperties.docs) {
            if (user.uid == user1.data()["UserId"]) {
              setState(
                () {
                  Gender = user1.data()["Gender"];
                  Age = user1.data()["Age"];
                },
              );
              break; 
            }
          }

          Fluttertoast.showToast(msg: 'Login successful. User ID: ${user.uid}');

          if (Gender == null && Age == null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => genderScreen()),
            );
          } else if (Gender != null && Age != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        } else {
          Fluttertoast.showToast(msg: 'Your email is not verified yet.');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => verifyScreen()),
          );
        }
      }
    } catch (e) {
      // Handle login error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content:
                Text('Login failed. Please enter a valid email and password.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    //auth = FirebaseAuth.instance;
  }
  @override
  void dispose() {
    _emailLoginController.dispose();
    _passwordLoginController.dispose();
    super.dispose();
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
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Welcome To ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "FITTECH ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                height: 50,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Hello there, let’s log in !",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Email Address:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _emailLoginController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(1, 255, 239, 1)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Password:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _passwordLoginController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(1, 255, 239, 1)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Forgot Password
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _loginUser();
                      });
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
                        "Log In",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Or Login With",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      googleGiris();
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/google2-removebg-preview.png',
                        scale: 9,
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "Register!",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> googleGiris() async {
    User? user = FirebaseAuth.instance.currentUser;
    final GoogleSignInAccount? googleUser =await GoogleSignIn().signIn();
    var UserProperties = await _firestore.collection("user-properties").get();
    if (googleUser != null) {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      for (var user1 in UserProperties.docs) {
        if (user != null) {
          if (user.uid == user1.data()["UserId"]) {
            setState(() {
              Gender = user1.data()["Gender"];
              Age = user1.data()["Age"];
              debugPrint("Gender:" + Gender!);
            });
          }
        }
      }
      await FirebaseAuth.instance.signInWithCredential(credential);

      var UserControl =
          await _firestore.collection("users").doc(user?.uid).get();

      if (UserControl.data()?['email'] == user?.email && Gender == null) {
        sabitler.userLoginControll = true;
      }
    }

    if (Gender == null && Age == null) {
      if (sabitler.userLoginControll == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => genderScreen()),
        );
      } else if (sabitler.userLoginControll == false) {
        navigateToRegisterScreen(context);
      }
    } else if (Gender != null && Age != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    sabitler.userLoginControll = false;
  }
}
