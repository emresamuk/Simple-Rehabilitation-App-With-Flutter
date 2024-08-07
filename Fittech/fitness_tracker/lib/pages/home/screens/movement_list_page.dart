import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../models/physiotherapy_movements copy.dart';
import 'movement_page.dart';

class MovementList extends StatefulWidget {
  const MovementList({super.key});

  @override
  State<MovementList> createState() => _MovementListState();
}

class _MovementListState extends State<MovementList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
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
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                //primary: false,
                padding: const EdgeInsets.only(top: 30),
                itemCount: PhysiotheraphyMovementsCopy
                    .movements[Sabitler.movementListRouteIndex].length,
                // Sabitler.movementListRouteIndex == 0
                //     ? Movements.LegMovements.length
                //     : Sabitler.movementListRouteIndex == 1
                //         ? Movements.ArmShoulderMovements.length
                //         : Movements.BackMovements.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 1.0), 
                          blurRadius: 5.0, 
                          spreadRadius: 8.0, 
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Sabitler.movementRouteIndex = index;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovementPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            child: Text(
                              PhysiotheraphyMovementsCopy.movements[Sabitler.movementListRouteIndex].keys.elementAt(index),
                              textAlign: TextAlign.center,
                               style: TextStyle( fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    PhysiotheraphyMovementsCopy.movements[Sabitler.movementListRouteIndex].values.elementAt(index),
                                  ),
                                ),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
