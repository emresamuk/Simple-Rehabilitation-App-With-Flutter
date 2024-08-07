import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/pages/home/screens/gender_page.dart';
import 'package:fitness_tracker/pages/home/screens/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailLoginController = TextEditingController();
  final TextEditingController _passwordLoginController =
      TextEditingController();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseAuth auth;

  Future<void> _validateAndSubmit() async {
    if (_emailLoginController.text.isEmpty ||
        _passwordLoginController.text.isEmpty ||
        _userNameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Error'),
            content: Text("Please fill out all fields."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Okay',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        },
      );
    } else {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailLoginController.text.trim(),
        password: _passwordLoginController.text.trim(),
      );

      User? user = userCredential.user;
      if (user != null) {
        final firestoreRef =
            FirebaseFirestore.instance.collection('users').doc();
        await firestoreRef.set({
          'phone_number': _phoneNumberController.text.toString(),
          'email': _emailLoginController.text.toString(),
          'full_name': _userNameController.text.toString(),
          'userID': user.uid.toString(),
          'ID': firestoreRef.id.toString(),
        }, SetOptions(merge: true));
        Fluttertoast.showToast(
            msg: 'Kayıt başarılı. Kullanıcı ID: ${user.uid}');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => verifyScreen(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 223, 224, 225),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "CREATE ACCOUNT ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Please enter your credentials \nto proceed.  ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Full Name:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3,
                      color: Color.fromRGBO(1, 255, 239, 1)),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')) // It only allows letter entry.
          ],

            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Phone:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3,
                      color: Color.fromRGBO(1, 255, 239, 1)),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly // Only allows number entry.
          ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Email Address:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
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
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Password:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
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
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _validateAndSubmit();
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
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Or Register With",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {

                  googleKayit();
               
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
                  "Already have an account?",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login!",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }

  Future<void> googleKayit() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    User? user = FirebaseAuth.instance.currentUser;

    if (googleUser != null) {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (user != null) {
        // Information received when logging in with Google
        var UserControl =
            await _firestore.collection("users").doc(user.uid).get();
        final String? userEmail = user.email;
        final String? userName = user.displayName;
        final String? userPhotoUrl = user.photoURL;

        if (userEmail == UserControl.data()?['email']) {
          sabitler.UserControl = true;
        }

        if (sabitler.UserControl == true) {
          debugPrint("Böyle Bir Kullanıcı Zaten Mevcut.");
          Fluttertoast.showToast(msg: 'Böyle Bir Kullanıcı Zaten Mevcut.');
        } else if (sabitler.UserControl == false) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'email': userEmail,
            'full_name': userName,
            'photoUrl': userPhotoUrl,
            'userID': user.uid.toString(),
            // You can add other user information here
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => genderScreen()));
        }

        await FirebaseAuth.instance.signInWithCredential(credential);
        sabitler.UserControl = false;
      }
    }
  }
}
