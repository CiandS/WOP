import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CleanroomPack extends StatefulWidget {
  @override
  _CleanroomPackState createState() => _CleanroomPackState();
}

class _CleanroomPackState extends State<CleanroomPack> {
  int _vacuumMachine = 1;
  int _sealingMachine = 1;
  bool _eccMachineCheck = false;
  bool _qracMachineCheck = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("Work Order Number: 1245678",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text("Attune PS Inserts",
            style: TextStyle(
              fontSize: 22,
            )),
        Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    width: 200,
                    child: Center(
                        child: Text('Quantity Remaining:',
                            style: TextStyle(
                              fontSize: 16,
                            ))))),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 200,
                padding: const EdgeInsets.only(bottom: 10.0),
                child: new LinearPercentIndicator(
                  width: 200.0,
                  lineHeight: 40.0,
                  percent: 1.0,
                  center: Text(
                    "10/10",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
        Container(
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(50.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text("Vacuuming Machine", style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: DropdownButton(
                            value: _vacuumMachine,
                            items: [
                              DropdownMenuItem(
                                child: Text("Please select your machine"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("VACS0015 - MultiVac C400TC Vacuum Sealer"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("VACS0018 - MultiVac C400TC Vacuum Sealer"),
                                  value: 3
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _vacuumMachine = value;
                              });
                            }),
                      ),
                      Text("Sealing Machine",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      DropdownButton(
                          value: _sealingMachine,
                          items: [
                            DropdownMenuItem(
                              child: Text("Please select your machine"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("SEAL0001 - Atlas Vac Tray-Lid Sealer"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("SEAL0005 - Atlas Vac Sealer"),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text("SEAL0008 - Seal Machine"),
                              value: 4,
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _sealingMachine = value;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              if(_sealingMachine == 2)
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
                            decoration: InputDecoration(
                                labelText: 'Input Quantity Processed'),
                            keyboardType: TextInputType.number,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
