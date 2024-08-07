import 'package:flutter/material.dart';
import '../pages/home/screens/weight_screen.dart';

//weight screen e geçiren button
class OldScreenButton {

  OldScreenButton();

   buildNextButton(context, String text, MaterialPageRoute route) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => weightScreen()));
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
        ),child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
