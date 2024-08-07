import 'package:fitness_tracker/pages/home/screens/app_constant.dart';
import 'package:fitness_tracker/pages/home/screens/height_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class weightScreen extends StatefulWidget {
  const weightScreen({super.key});

  @override
  State<weightScreen> createState() => _weightScreenState();
}

class _weightScreenState extends State<weightScreen> {
   final TextEditingController WeightController = TextEditingController();
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
                "Step 3 of 5",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "HOW MUCH DO YOU WEIGHT? ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height:200), 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: WeightController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly 
                ],
                decoration: InputDecoration(
                  labelText: 'Please enter your weight.',
                  suffixText: '|kg', 
                  counterText: '', 
                  border: OutlineInputBorder(),
                ),
                
              ),
            ),
            SizedBox(height: 255), 
            Align(
              alignment: Alignment.center,
              child:GestureDetector(
      onTap: () {
         sabitler.Weight=WeightController.text.toString();
        Navigator.push(context, MaterialPageRoute(builder: (context) => heightScreen()));
       
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
