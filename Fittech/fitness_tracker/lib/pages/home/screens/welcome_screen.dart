import 'package:fitness_tracker/pages/home/screens/log_in_screen.dart';
import 'package:fitness_tracker/widgets/next_diveIn_jumpIn_buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
const WelcomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 224, 225),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 456,
            width: 456,
            decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/e43c1269-0b8a-4dcd-ade1-11928a2172b6.png"), fit: BoxFit.cover ))),
          Text("Welcome To FitTech",style: TextStyle(fontSize:  24, fontWeight:FontWeight.w900),),
          SizedBox(height: 50,),
          Center(
            child: Container(
              child: Text("We are here for make your activities more effective and feel you more comfortable while you are doing sports",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
            ),
          ),SizedBox(height: 30,),
         nextButton().buildNextButton(context, "Dive in!", MaterialPageRoute(builder: (context) => LoginScreen(),)),

      ]),) ;
  }

}