import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order.dart';
import 'package:work_order_process/models/work_order_history.dart';
import 'package:work_order_process/providers/work_order_history_provider.dart';
import 'package:work_order_process/providers/work_order_provider.dart';
import 'package:work_order_process/utils/work_order_util.dart';

import '../../../constants.dart';

class Cleanline extends StatefulWidget {
  final VoidCallback callback;

  Cleanline(this.callback);

  @override
  _CleanlineState createState() => _CleanlineState();
}

class _CleanlineState extends State<Cleanline> {
  int _cleaningMachine = 1;
  bool eccShiftCleanCheck = false;
  bool eccDailyCleanCheck = false;
  bool eccWeeklyCleanCheck = true;
  double quantityProcessed = 0.0;
  final quantityProcessedTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    quantityProcessedTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WorkOrder workOrder =
        Provider.of<WorkOrderProvider>(context, listen: false).getWorkOrder;

    AlertDialog overQuantity = AlertDialog(
      title: Icon(
        Icons.info_outline,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Exceeded remaining Quantity'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

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
                          child: Text('Quantity Processed:',
                              style: TextStyle(
                                fontSize: 16,
                              ))))),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new LinearPercentIndicator(
                    animation: true,
                    width: 200.0,
                    lineHeight: 40.0,
                    percent: quantityProcessed,
                    center: Text(
                      "${WorkOrderUtil.getInstance.getQuantityProcessedPercentage(quantityProcessed)}/10",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: quantityProcessed == 1.0
                        ? Colors.green
                        : Colors.blue[800],
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
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
                                  child: Text(
                                      "CPSS0010 - Branson Ultrasonic Tank"),
                                  value: 3),
                              DropdownMenuItem(
                                child: Text("CPSS0012 - 5 Stage Cleanline"),
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
                if (_cleaningMachine == 2 ||
                    _cleaningMachine == 3 ||
                    _cleaningMachine == 4)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
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
                          Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: CheckboxListTile(
                                title: Text('ECC Checks'),
                                subtitle: Text('Frequency: Shift'),
                                secondary: Icon(
                                  Icons.assignment,
                                ),
                                value: eccShiftCleanCheck,
                                onChanged: (value) {
                                  setState(() {
                                    eccShiftCleanCheck = value;
                                  });
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: CheckboxListTile(
                                title: Text('ECC Checks'),
                                subtitle: Text('Frequency: Daily'),
                                secondary: Icon(
                                  Icons.assignment,
                                ),
                                value: eccDailyCleanCheck,
                                onChanged: (value) {
                                  setState(() {
                                    eccDailyCleanCheck = value;
                                  });
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: CheckboxListTile(
                                title: Text('ECC Checks'),
                                subtitle: Text('Frequency: Weekly'),
                                secondary: Icon(
                                  Icons.assignment,
                                ),
                                value: eccWeeklyCleanCheck,
                                onChanged: (value) {
                                  setState(() {
                                    eccWeeklyCleanCheck = value;
                                  });
                                }),
                          ),
                          if (eccDailyCleanCheck == true &&
                              eccShiftCleanCheck == true &&
                              eccWeeklyCleanCheck == true)
                            Container(
                                width: 400.0,
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            controller:
                                                quantityProcessedTextController,
                                            decoration: InputDecoration(
                                                labelText:
                                                    'Input Quantity Processed'),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 40,
                                          child: OutlinedButton.icon(
                                            label: Text(
                                              'Process',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            icon: Icon(
                                              Icons.miscellaneous_services,
                                              size: 28,
                                            ),
                                            onPressed: quantityProcessed == 1.0
                                                ? null
                                                : () {
                                                    setState(() {
                                                      (double.parse(quantityProcessedTextController
                                                                          .text) /
                                                                      10 +
                                                                  quantityProcessed >
                                                              1.0)
                                                          ? showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return overQuantity;
                                                              },
                                                            )
                                                          : quantityProcessed +=
                                                              double.parse(
                                                                      quantityProcessedTextController
                                                                          .text) /
                                                                  10;
                                                    });

                                                    if (quantityProcessed ==
                                                        1.0) {
                                                      Provider.of<WorkOrderHistoryProvider>(
                                                              context)
                                                          .addWorkOrderHistory(
                                                        WorkOrderHistory(
                                                            Constants.CLEANLINE,
                                                            DateTime.now(),
                                                            "test1234",
                                                            WorkOrderUtil
                                                                .getInstance
                                                                .getQuantityProcessedPercentage(
                                                                    quantityProcessed),
                                                            null),
                                                      );
                                                      widget.callback();
                                                    }
                                                  },
                                          ))
                                    ],
                                  ),
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
