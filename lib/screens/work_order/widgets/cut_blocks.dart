import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order.dart';
import 'package:work_order_process/models/work_order_history.dart';
import 'package:work_order_process/providers/work_order_history_provider.dart';
import 'package:work_order_process/providers/work_order_provider.dart';
import 'package:work_order_process/utils/work_order_util.dart';

import '../../../constants.dart';

class CutBlocks extends StatefulWidget {
  final VoidCallback callback;

  CutBlocks(this.callback);

  @override
  _CutBlocksState createState() => _CutBlocksState();
}

class _CutBlocksState extends State<CutBlocks> {
  int cuttingMachine = 1;
  bool _eccCutCheck = false;
  bool _qracCutCheck = false;
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
        child: Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Text(
          "Work Order Number: ${workOrder.getWorkOrderNumber}",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "Attune PS Inserts",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        Divider(
          indent: 250,
          endIndent: 250,
          thickness: 2,
        ),
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
              if (cuttingMachine == 2 ||
                  cuttingMachine == 3 ||
                  cuttingMachine == 4)
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
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CheckboxListTile(
                              title: Text('ECC Checks'),
                              subtitle: Text('Frequency: Daily'),
                              secondary: Icon(Icons.assignment),
                              value: _eccCutCheck,
                              onChanged: (value) {
                                setState(() {
                                  _eccCutCheck = value;
                                });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: CheckboxListTile(
                              title: Text('QRAC Checks'),
                              subtitle: Text('Frequency: Hourly'),
                              secondary: Icon(Icons.assignment),
                              value: _qracCutCheck,
                              onChanged: (value) {
                                setState(() {
                                  _qracCutCheck = value;
                                });
                              }),
                        ),
                        if (_eccCutCheck == true && _qracCutCheck == true)
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
                                                          Constants.CUT_BLOCKS,
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
                                                }),
                                    )
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
      ]),
    ));
  }
}
