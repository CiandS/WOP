import 'package:flutter/material.dart';
import 'package:work_order_process/screens/work_order/widgets/cleanline.dart';
import 'package:work_order_process/screens/work_order/widgets/cleanroom_pack.dart';
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
    WorkOrderStep(0, 'Issue Material', 'Q1', IssueMaterial()),
    WorkOrderStep(1, 'Cut Blocks', 'Q1', CutBlocks()),
    WorkOrderStep(2, 'Machine', 'Q1', MachineStep()),
    WorkOrderStep(3, 'Cleanline', 'Q1', Cleanline()),
    WorkOrderStep(4, 'Generate Labels', 'Q1', GenLabels()),
    WorkOrderStep(5, 'Cleanroom Packaging', 'Q1', CleanroomPack()),
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
    if (currentStep >= i) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  bool isActive(int i) {
    return _getState(i) == StepState.complete;
  }

  next() {
    currentStep + 1 != steps.length
        ? setState(() => currentStep++)
        : setState(() => complete = true);
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
                      steps: _getSteps(context),
                      type: StepperType.horizontal,
                      currentStep: currentStep,
                      controlsBuilder: (context,
                          {onStepCancel, onStepContinue}) {
                        return Row(
                          children: <Widget>[
                            TextButton(
                              onPressed: onStepContinue,
                              child: const Text('NEXT'),
                            ),
                            TextButton(
                              onPressed: onStepCancel,
                              child: const Text('CANCEL'),
                            ),
                          ],
                        );
                      },
                      onStepContinue: next,
                      onStepCancel: cancel,
                      onStepTapped: (step) => goTo(step)),
                ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.list),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => WOHistoryPage()));
          }),
    );
  }
}
