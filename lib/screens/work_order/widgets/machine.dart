import 'package:flutter/material.dart';

class MachineStep extends StatefulWidget {
  @override
  _MachineStepState createState() => _MachineStepState();
}

class _MachineStepState extends State<MachineStep> {

  int _value = 1;
  int _valuetwo = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Machine\n", style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Quality Machine", style: TextStyle(fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Machine 1"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Machine 2 "),
                          value: 2,
                        ),
                        DropdownMenuItem(
                            child: Text("Machine 3"),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text("Machine 4"),
                            value: 4
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
                Text("Process Machine", style: TextStyle(fontSize: 20,)),
                DropdownButton(
                    value: _valuetwo,
                    items: [
                      DropdownMenuItem(
                        child: Text("Machine 1 test"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Machine 2 test"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                          child: Text("Machine 3"),
                          value: 3
                      ),
                      DropdownMenuItem(
                          child: Text("Machine 4"),
                          value: 4
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        _valuetwo = value;
                      });
                    }),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Input Quantity'),
                  keyboardType: TextInputType.number,
                ),
              ]
          ),
        )
    );
  }
}