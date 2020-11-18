import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CleanroomPack extends StatefulWidget {
  @override
  _CleanroomPackState createState() => _CleanroomPackState();
}

class _CleanroomPackState extends State<CleanroomPack> {
  int _qualityMachine = 1;
  int _processMachine = 1;
  bool _eccMachineCheck = false;
  bool _qracMachineCheck = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text ("Work Order Number: 1245678", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Attune PS Inserts\n", style: TextStyle(fontSize: 22,)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new LinearPercentIndicator(
                    width: 200.0,
                    lineHeight: 40.0,
                    percent: 1.0,
                    center: Text(
                      "10/10 Remaining QTY",
                      style: TextStyle(fontSize: 18),
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(20.0 ),
                    color: Colors.green,
                    child: Column(
                      children: [
                        Text("Quality Machine", style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: DropdownButton(
                              value: _qualityMachine,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Please select your machine"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Machine 1"),
                                  value: 2,
                                ),
                                DropdownMenuItem(child: Text("Machine 2"), value: 3),
                                DropdownMenuItem(
                                  child: Text("Machine 3"),
                                  value: 4,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _qualityMachine = value;
                                });
                              }),
                        ),
                        Text("Process Machine",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        DropdownButton(
                            value: _processMachine,
                            items: [
                              DropdownMenuItem(
                                child: Text("Please select your machine"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Machine 2 test"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("Machine 3"),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text("Machine 4"),
                                value: 4,
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                _processMachine = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        CheckboxListTile(
                            title: Text('ECC Checks'),
                            subtitle: Text('Frequency: Daily'),
                            secondary: Icon(Icons.alarm_on),
                            value: _eccMachineCheck,
                            onChanged: (value) {
                              setState(() {
                                _eccMachineCheck = value;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('QRAC Checks'),
                            subtitle: Text('Frequency: Hourly'),
                            secondary: Icon(Icons.alarm_on),
                            value: _qracMachineCheck,
                            onChanged: (value) {
                              setState(() {
                                _qracMachineCheck = value;
                              });
                            }),
                        Container(
                            width: 300.0,
                            child: TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Input Quantity Processed'),
                              keyboardType: TextInputType.number,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));}
}
