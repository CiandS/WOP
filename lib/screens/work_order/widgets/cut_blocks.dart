import 'package:flutter/material.dart';

class CutBlocks extends StatefulWidget {
  @override
  _CutBlocksState createState() => _CutBlocksState();
}

class _CutBlocksState extends State<CutBlocks> {
  int cuttingMachine = 1;
  bool _eccCutCheck = false;
  bool _qracCutCheck = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: new EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Work Order Number: 1245678",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Attune PS Inserts\n",
                    style: TextStyle(
                      fontSize: 22,
                    )),
                Text("Cutting Machine", style: TextStyle(fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: DropdownButton(
                      value: cuttingMachine,
                      items: [
                        DropdownMenuItem(
                          child: Text("Please select a cutting machine"),
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
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          cuttingMachine = value;
                        });
                      }),
                ),
                if (cuttingMachine == 2)
                  Column(children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Input Quantity'),
                      keyboardType: TextInputType.number,
                    ),
                    CheckboxListTile(
                        title: Text('ECC Checks'),
                        subtitle: Text('Frequency: Daily'),
                        secondary: Icon(Icons.alarm_on),
                        value: _eccCutCheck,
                        onChanged: (value) {
                          setState(() {
                            _eccCutCheck = value;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('QRAC Checks'),
                        subtitle: Text('Frequency: Hourly'),
                        secondary: Icon(Icons.alarm_on),
                        value: _qracCutCheck,
                        onChanged: (value) {
                          setState(() {
                            _qracCutCheck = value;
                          });
                        }),
                  ]),
              ]),
        ));
  }
}