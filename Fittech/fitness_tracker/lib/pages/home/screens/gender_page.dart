import 'package:fitness_tracker/pages/home/screens/age_screen.dart';
import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/widgets/gender_screen_button.dart';
import 'package:flutter/material.dart';

class genderScreen extends StatelessWidget {
  const genderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 224, 225),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Step 1 of 5",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "WHAT IS YOUR GENDER? ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(height: 100,),
                Padding(
            padding: EdgeInsets.only(left: 45),
            child: SizedBox(
              width: 300,
              child: ElevatedButton.icon(
      onPressed: () {
        sabitler.Gender="Male";
      },
      icon: Icon(Icons.male),
      label: Text("Male"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
        elevation: MaterialStateProperty.all<double>(0),
      ),
    )
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: SizedBox(
              width: 300,
              child: ElevatedButton.icon(
      onPressed: () {
        sabitler.Gender="Female";
      },
      icon: Icon(Icons.female),
      label: Text("Female"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
        elevation: MaterialStateProperty.all<double>(0),
      ),
    )
            ),
          ),
          SizedBox(height: 330,),
          Align(
            alignment: Alignment.center,
            child: GenderScreenButton().buildNextButton(
              context,
              "Next",
              MaterialPageRoute(builder: (context) => ageScreen()),
            ),
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


