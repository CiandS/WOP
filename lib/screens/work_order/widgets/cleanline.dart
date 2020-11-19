import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order.dart';
import 'package:work_order_process/providers/work_order_provider.dart';

class Cleanline extends StatefulWidget {
  @override
  _CleanlineState createState() => _CleanlineState();
}

class _CleanlineState extends State<Cleanline> {
  int _cleaningMachine = 1;
  bool eccShiftCleanCheck = false;
  bool eccDailyCleanCheck = false;
  bool eccWeeklyCleanCheck = true;

  @override
  Widget build(BuildContext context) {
    WorkOrder workOrder =
        Provider.of<WorkOrderProvider>(context, listen: false).getWorkOrder;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Work Order Number: ${workOrder.getWorkOrderNumber}",
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
                    padding: const EdgeInsets.all(30.0),
                    color: Colors.white,
                    child: Column(children: [
                      Text("Select your Machine\n",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("Cleaning Machine", style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: DropdownButton(
                            value: _cleaningMachine,
                            items: [
                              DropdownMenuItem(
                                child: Text("Please select your machine"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("CPS0002 - Cleanline"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Machine 2"), value: 3),
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
                      ),
                    ]),
                  ),
                ),
                if (_cleaningMachine == 2)
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
                              subtitle: Text('Frequency: Shift'),
                              secondary: Icon(Icons.alarm_on),
                              value: eccShiftCleanCheck,
                              onChanged: (value) {
                                setState(() {
                                  eccShiftCleanCheck = value;
                                });
                              }),
                          CheckboxListTile(
                              title: Text('ECC Checks'),
                              subtitle: Text('Frequency: Daily'),
                              secondary: Icon(Icons.alarm_on),
                              value: eccDailyCleanCheck,
                              onChanged: (value) {
                                setState(() {
                                  eccDailyCleanCheck = value;
                                });
                              }),
                          CheckboxListTile(
                              title: Text('ECC Checks'),
                              subtitle: Text('Frequency: Weekly'),
                              secondary: Icon(Icons.alarm_on),
                              value: eccWeeklyCleanCheck,
                              onChanged: (value) {
                                setState(() {
                                  eccWeeklyCleanCheck = value;
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
      ),
    );
  }
}
