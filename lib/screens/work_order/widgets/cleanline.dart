import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Cleanline extends StatefulWidget {
  @override
  _CleanlineState createState() => _CleanlineState();
}

class _CleanlineState extends State<Cleanline> {

  int _cleaningMachine = 1;
  bool _eccCleanCheck = true;
  bool _qracCleanCheck = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Work Order Number: 1245678",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Text("Attune PS Inserts\n",
              style: TextStyle(
                fontSize: 22,
              )),
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
      DropdownButton(
          value: _cleaningMachine,
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
              _cleaningMachine = value;
            });
          }),
          if (_cleaningMachine == 2)
          Container(
            child: Column(
              children: [
                CheckboxListTile(
                    title: Text('ECC Checks'),
                    subtitle: Text('Frequency: Daily'),
                    secondary: Icon(Icons.alarm_on),
                    value: _eccCleanCheck,
                    onChanged: (value) {
                      setState(() {
                        _eccCleanCheck = value;
                      });
                    }),
                CheckboxListTile(
                    title: Text('QRAC Checks'),
                    subtitle: Text('Frequency: Hourly'),
                    secondary: Icon(Icons.alarm_on),
                    value: _qracCleanCheck,
                    onChanged: (value) {
                      setState(() {
                        _qracCleanCheck = value;
                      });
                    }),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Input Amount'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
