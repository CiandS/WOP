import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Work Order Number: 1245678",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      padding: const EdgeInsets.all(30.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text("Select your Machine\n",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
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
                                    child: Text("CSAW0004 - Kastro Circular Saw"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(child: Text("Machine 3"), value: 3),
                                  DropdownMenuItem(child: Text("Machine 4"), value: 4),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    cuttingMachine = value;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (cuttingMachine == 2)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(30.0),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text(
                                    'Condition Checks',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
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
                    )],
              ),
            ),
          ]),
    ));
  }
}
