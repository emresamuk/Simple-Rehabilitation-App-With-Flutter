import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/pages/home/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_constants.dart';
import 'goal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override

  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  var currentUser ="";
  @override
  void initState() {
    getUserName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var dateFormatter = DateFormat('EEEE, dd, MMMM'); 

    String formattedDate = dateFormatter.format(now);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
        onTap: () {
          _logout(context);
  
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "LOG OUT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
       SizedBox(
            height: 10,
          ),

          Container(
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome $currentUser",style:TextStyle(
                     color: Colors.grey,
                     fontSize: 21,
                     fontWeight: FontWeight.bold,
                   ),),
                   SizedBox(height: 5),
                Text(
                   formattedDate,
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 17,
                     fontWeight: FontWeight.w800,
                   ),
                   textAlign: TextAlign.center,
                 ),
              ],
            )

          ),
         
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 90),
            child: Text(
              "Choose your goal to start!",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 115,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalPage(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Arm/Ankle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 2;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoalPage(),
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Leg",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          Container(
            height: 115,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalPage(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 2;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoalPage(),
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Hip",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          Container(
            height: 115,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalPage(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Relaxing",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 2;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoalPage(),
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Muscle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          Container(
            height: 115,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalPage(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Relaxing",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Sabitler.goalPageRouteIndex = 2;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoalPage(),
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Text(
                        "Muscle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),  
              ],
            ),
          ),
        ],
      ),
    );
  }
    void getUserName() async {
    if (user != null) {
      var usersSnapshot =
          await _firestore.collection("users").get();
          for(var idler in usersSnapshot.docs){
            print(idler.data()["full_name"]);

            if(user!.uid== idler.data()['userID']){
              setState(() {
                currentUser = idler.data()['full_name'].toString();
              });
            }

          } 
  }
 }
 final FirebaseAuth _auth = FirebaseAuth.instance;
 void _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
);
}   
}



