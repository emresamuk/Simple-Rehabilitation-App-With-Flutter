import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/pages/home/screens/weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class ageScreen extends StatefulWidget {
  const ageScreen({super.key});

  @override
  State<ageScreen> createState() => _ageScreenState();
}

class _ageScreenState extends State<ageScreen> {
  final TextEditingController AgeController = TextEditingController();
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
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Step 2 of 5",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "HOW OLD ARE YOU? ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height:200), 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly 
                ],
                decoration: InputDecoration(
                  labelText: 'Please enter your age.',
                  border: OutlineInputBorder(),
                ),
                controller: AgeController,
             
              ),
            ),
            SizedBox(height: 290), 
            Align(
              alignment: Alignment.center,
              child:GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => weightScreen()));
        sabitler.Age=AgeController.text.toString();
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
        ),child: Text("Next", textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
      ),
    )
            ),
          ],
        ),
      ),
    );
  }
}
