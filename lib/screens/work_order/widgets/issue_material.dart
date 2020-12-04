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
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(30.0),
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
                            Icons.pending_actions,
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          // offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 200.0,
                            child: Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    // width: 200,
                                    child: TextFormField(
                                      controller:
                                          quantityProcessedTextController,
                                      decoration: InputDecoration(
                                          labelText:
                                              'Input Quantity Processed'),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
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
                                                          builder: (BuildContext
                                                              context) {
                                                            return overQuantity;
                                                          },
                                                        )
                                                      : quantityProcessed +=
                                                          double.parse(
                                                                  quantityProcessedTextController
                                                                      .text) /
                                                              10;
                                                  if (quantityProcessed ==
                                                      1.0) {
                                                    Provider.of<WorkOrderHistoryProvider>(
                                                            context)
                                                        .addWorkOrderHistory(
                                                      WorkOrderHistory(
                                                          Constants
                                                              .ISSUE_MATERIAL,
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
