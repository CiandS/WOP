import 'package:flutter/material.dart';

class MachineStep extends StatefulWidget {
  @override
  _MachineStepState createState() => _MachineStepState();
}

class _MachineStepState extends State<MachineStep> {
  int _qualityMachine = 1;
  int _processMachine = 1;
  bool _eccMachineCheck = false;
  bool _qracMachineCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: new EdgeInsets.symmetric(horizontal: 200.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text("Work Order Number: 1245678",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text("Attune PS Inserts\n",
                  style: TextStyle(
                    fontSize: 22,
                  )),
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
              if (_processMachine == 2)
                Container(
                    child: Row(
                      children: [
                        Column(
                  children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Input Quantity'),
                          keyboardType: TextInputType.number,
                        ),
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
                  ],
                ),
                      ],
                    ))
            ],
          ),
        ));
  }
}
