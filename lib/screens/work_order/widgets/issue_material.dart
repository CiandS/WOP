import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order.dart';
import 'package:work_order_process/models/work_order_history.dart';
import 'package:work_order_process/providers/work_order_history_provider.dart';
import 'package:work_order_process/providers/work_order_provider.dart';
import 'package:work_order_process/utils/work_order_util.dart';

import '../../../constants.dart';

class IssueMaterial extends StatefulWidget {
  final VoidCallback callback;

  IssueMaterial(this.callback);

  @override
  _IssueMaterialState createState() => _IssueMaterialState();
}

class _IssueMaterialState extends State<IssueMaterial> {
  @override
  int cuttingMachine = 1;
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
        children: <Widget>[
          Text("Work Order Number: ${workOrder.getWorkOrderNumber}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("Attune PS Inserts",
              style: TextStyle(
                fontSize: 22,
              )),
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
                        // CircularProgressIndicator(
                        //   value: quantityProcessed,
                        //   backgroundColor: Colors.grey,
                        //   strokeWidth: 10,
                        // ),
                        CircularPercentIndicator(
                          animation: true,
                          radius: 150.0,
                          lineWidth: 30.0,
                          percent: quantityProcessed,
                          header: Text('Original Quantity: 10',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          center: new Icon(
                            Icons.linear_scale,
                            size: 50.0,
                          ),
                          footer: Text(
                              'Quantity Processed: ${WorkOrderUtil.getInstance.getQuantityProcessedPercentage(quantityProcessed)}',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          progressColor: quantityProcessed == 1.0
                              ? Colors.green
                              : Colors.blue[800],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(120.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
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
                                          style: TextStyle(
                                              color: Colors.redAccent[700],
                                              fontSize: 16),
                                        ),
                                        icon: Icon(
                                          Icons.settings,
                                          color: Colors.redAccent[700],
                                          size: 28,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            (double.parse(quantityProcessedTextController.text) / 10 + quantityProcessed  > 1.0)
                                                ? showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return overQuantity;
                                              },
                                            )
                                                :
                                            quantityProcessed += double.parse(
                                                quantityProcessedTextController
                                                    .text) /
                                                10;
                                            if (quantityProcessed == 1.0) {
                                              Provider.of<WorkOrderHistoryProvider>(
                                                      context)
                                                  .addWorkOrderHistory(
                                                WorkOrderHistory(
                                                    Constants.ISSUE_MATERIAL,
                                                    DateTime.now(),
                                                    "test1234",
                                                    WorkOrderUtil.getInstance
                                                        .getQuantityProcessedPercentage(
                                                            quantityProcessed),
                                                    null),
                                              );

                                              widget.callback();
                                            }
                                          });
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
