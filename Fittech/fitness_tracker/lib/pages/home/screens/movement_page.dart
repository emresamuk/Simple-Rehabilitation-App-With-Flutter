import 'package:fitness_tracker/models/movement_description.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_constants.dart';
import '../../../models/physiotherapy_movements copy.dart';

class MovementPage extends StatefulWidget {
  const MovementPage({super.key});

  @override
  State<MovementPage> createState() => _MovementPageState();
}

class _MovementPageState extends State<MovementPage> {
  int totalDuration =
      5 * 60;
  int currentDuration = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                    ),
                  ),
                  
                ],
              ),
            ),
          Center(
            child: Text(
              "Muscle",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: Center(
              child: Text(
                PhysiotheraphyMovementsCopy.movements[Sabitler.movementListRouteIndex].keys.elementAt(Sabitler.movementRouteIndex),
                textAlign: TextAlign.center, 
                style: TextStyle( fontSize: 15),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                     PhysiotheraphyMovementsCopy.movements[Sabitler.movementListRouteIndex].values.elementAt(Sabitler.movementRouteIndex),
                    ),
                  fit: BoxFit.contain),
            ),
          ),
          Container(
  height: 250,
  width: double.infinity,
  child: ListView(
    padding: EdgeInsets.only(left: 20, top: 30),
    children: [
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: formatText(
            movementDescription.description[Sabitler.movementListRouteIndex]
                .elementAt(Sabitler.movementRouteIndex),
          ),
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
List<InlineSpan> formatText(String text) {
  final List<InlineSpan> formattedText = [];

  final List<String> boldKeywords = ['Client`s aim:', 'Client`s instructions:', 'Precautions:'];

  for (String keyword in boldKeywords) {
    if (text.contains(keyword)) {
      final List<String> parts = text.split(keyword);

      formattedText.add(TextSpan(text: parts[0]));
      formattedText.add(TextSpan(text: keyword, style: TextStyle(fontWeight: FontWeight.bold)));
      text = parts[1];
    }
  }

  if (text.isNotEmpty) {
    formattedText.add(TextSpan(text: text));
  }

  return formattedText;
}


