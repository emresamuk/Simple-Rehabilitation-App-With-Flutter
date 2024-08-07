import 'package:flutter/material.dart';
import '../../../constants/app_constants.dart';
import '../../../models/physiotherapy_movements copy.dart';
import 'movement_list_page.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
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
              height: 500,
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: TabBar(
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                      labelColor: Colors.black,
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: "Relaxing",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: ListView.builder(
                            //primary: false,
                            padding: const EdgeInsets.only(top: 10),
                            itemCount:
                                PhysiotheraphyMovementsCopy.a_z_movement.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Sabitler.movementListRouteIndex = index;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MovementList(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          PhysiotheraphyMovementsCopy
                                              .a_z_movement.keys
                                              .elementAt(index),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(0,1), 
                                                  blurRadius:12, 
                                                  spreadRadius:2, 
                                                ),
                                              ],
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                    PhysiotheraphyMovementsCopy
                                                        .a_z_movement.values
                                                        .elementAt(index),
                                                  )),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        //
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}