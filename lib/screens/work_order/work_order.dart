import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order_history.dart';
import 'package:work_order_process/providers/work_order_history_provider.dart';
import 'package:work_order_process/screens/work_order/widgets/cleanline.dart';
import 'package:work_order_process/screens/work_order/widgets/cleanroom_pack.dart';
import 'package:work_order_process/screens/work_order/widgets/work_order_input.dart';
import 'package:work_order_process/widgets/animated_fab.dart';
import '../../constants.dart';
import '../../models/work_order_step.dart';
import '../../screens/work_order_history/work_order_history.dart';
import 'widgets/cut_blocks.dart';
import 'widgets/gen_labels.dart';
import 'widgets/issue_material.dart';
import 'widgets/machine.dart';
import 'widgets/cleanline.dart';
import 'widgets/cleanroom_pack.dart';

class WorkOrderPage extends StatefulWidget {
  @override
  _WorkOrderPageState createState() => new _WorkOrderPageState();
}

class _WorkOrderPageState extends State<WorkOrderPage> {
  int currentStep = 0;
  bool complete = false;
  List<Step> steps = <Step>[];
  List<WorkOrderStep> workOrderSteps = [
    WorkOrderStep(0, 'Work Order Input', 'Q1', WorkOrderIiput()),
    WorkOrderStep(1, 'Issue Material', 'Q1', IssueMaterial()),
    WorkOrderStep(2, 'Cut Blocks', 'Q1', CutBlocks()),
    WorkOrderStep(3, 'Machine', 'Q1', MachineStep()),
    WorkOrderStep(4, 'Cleanline', 'Q1', Cleanline()),
    WorkOrderStep(5, 'Generate Labels', 'Q1', GenLabels()),
    WorkOrderStep(6, 'Cleanroom Packaging', 'Q1', CleanroomPack()),
  ];

  List<Step> _getSteps(BuildContext context) {
    steps = [];
    workOrderSteps.forEach(
      (workOrderStep) => steps.add(
        Step(
          title: Text(workOrderStep.stepTitle),
          subtitle: Text(workOrderStep.stepSubTitle),
          content: workOrderStep.stepContent,
          state: _getState(workOrderStep.index),
          isActive: isActive(workOrderStep.index),
        ),
      ),
    );
    return steps;
  }

  StepState _getState(int i) {
    if (currentStep > i) {
      return StepState.complete;
    } else if (currentStep == i) {
      return StepState.editing;
    } else {
      return StepState.indexed;
    }
  }

  bool isActive(int i) {
    return _getState(i) == StepState.complete;
  }

  void setNextStep() {
    currentStep + 1 != steps.length
        ? setState(() => currentStep++)
        : setState(() => complete = true);
  }

  void next() {
    WorkOrderStep currentWorkOrderStep = workOrderSteps[currentStep];

    bool isWorkOrderStepProcessed =
        Provider.of<WorkOrderHistoryProvider>(context)
            .isWorkOrderStepProcessed(currentWorkOrderStep.stepTitle);

    if (isWorkOrderStepProcessed) {
      setNextStep();
    } else if (currentWorkOrderStep.stepTitle == Constants.WORK_ORDER_INPUT) {
      setNextStep();
    } else {
      debugPrint('Qty not set yet');
    }
  }

  cancel() {
    if (currentStep > 0) {
      setState(() {
        currentStep = 0;
      });
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Work Order Process')),
      ),
      body: Center(
        child: Column(children: <Widget>[
          complete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: new Text("Work Order Complete"),
                      content: new Text(
                        "Shipping process has begun",
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            setState(() {
                              complete = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                      controlsBuilder: (context,
                          {onStepCancel, onStepContinue}) {
                        return Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.blue,
                                onPressed: onStepContinue,
                                child: const Text('NEXT'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RaisedButton(
                                onPressed: onStepCancel,
                                child: const Text('CANCEL'),
                              ),
                            ],
                          ),
                        );
                      },
                      steps: _getSteps(context),
                      type: StepperType.horizontal,
                      currentStep: currentStep,
                      onStepContinue: next,
                      onStepCancel: cancel,
                      onStepTapped: (step) => goTo(step)),
                ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.list),
      //     onPressed: () {
      //       Navigator.push(context,
      //           new MaterialPageRoute(builder: (context) => WOHistoryPage()));
      //     }),
      floatingActionButton: AnimatedFab(),
    );
  }
}
