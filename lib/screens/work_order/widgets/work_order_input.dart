import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/providers/work_order_provider.dart';

class WorkOrderInput extends StatefulWidget {
  @override
  _WorkOrderInputState createState() => _WorkOrderInputState();
}

class _WorkOrderInputState extends State<WorkOrderInput> {
  int cuttingMachine = 1;
  bool _eccCutCheck = false;
  bool _qracCutCheck = false;
  final TextEditingController _pinPutController = TextEditingController();
  BoxDecoration get _pinPutSelectedDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Image.asset(
                'j&j.png',
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black12,
              child: Row(
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
                          FittedBox(
                            child: Text("Enter your Work Order\n",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Container(
                              color: Colors.white,
                              child: PinPut(
                                eachFieldPadding: EdgeInsets.all(0),
                                eachFieldMargin: EdgeInsets.all(2.5),
                                eachFieldWidth: 20,
                                eachFieldHeight: 55,
                                fieldsCount: 9,
                                fieldsAlignment: MainAxisAlignment.center,
                                onSubmit: (String workOrderNumber) =>
                                    Provider.of<WorkOrderProvider>(context,
                                            listen: false)
                                        .addWorkOrderNumber(workOrderNumber),
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration: _pinPutDecoration,
                                selectedFieldDecoration:
                                    _pinPutSelectedDecoration,
                                followingFieldDecoration: _pinPutDecoration,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    ));
  }
}
