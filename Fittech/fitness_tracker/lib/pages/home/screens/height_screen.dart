import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/pages/home/screens/lets_jump_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 

class heightScreen extends StatefulWidget {
  const heightScreen({super.key});

  @override
  State<heightScreen> createState() => _heightScreenState();
}

class _heightScreenState extends State<heightScreen> {
  final TextEditingController HeightController = TextEditingController();
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
                "Step 4 of 5",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "HOW MUCH DO YOU HEIGHT? ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height:200), 
           Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: TextField(
    controller: HeightController,
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly,
    ],
    decoration: InputDecoration(
      labelText: 'Please enter your height.',
      suffixText: '|cm', 
      counterText: '', // Remove the character counter text
      border: OutlineInputBorder(),
    ),
  ),
),

            SizedBox(height: 255), 
           Align(
              alignment: Alignment.center,
              child:GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => letsJumpInScreen()));
        sabitler.Height=HeightController.text.toString();
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
