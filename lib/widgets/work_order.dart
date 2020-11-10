import 'package:flutter/material.dart';

class WorkOrderPage extends StatefulWidget {
  @override
  _WorkOrderPageState createState() => new _WorkOrderPageState();
}

class _WorkOrderPageState extends State<WorkOrderPage> {

  List<Step> spr = <Step>[];
  List<Step> _getSteps(BuildContext context) {
    spr = <Step>[
      Step(
          title: const Text('Issue Material'),
          subtitle: Text('SubTitle1'),
          content: Column(
    children: <Widget>[
    TextFormField(
    decoration: InputDecoration(labelText: 'Email Address'),
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Password'),
    ),
    ],
    ),
          state: _getState(1),
          isActive: isActive(1)),
      Step(

          title: const Text('Hello2'),
          subtitle: Text('SubTitle2'),
          content: const Text('This is Content2'),
          state: _getState(2),
          isActive: isActive(2)),
      Step(
          title: const Text('Hello3'),
          subtitle: Text('SubTitle3'),
          content: const Text('This is Content3'),
          state: _getState(3),
          isActive: isActive(3)),
    ];
    return spr;
  }

  StepState _getState(int i) {
    if (currentStep >= i) {
    return StepState.complete;
    } else {
    return  StepState.editing;
    }
  }

  bool isActive(int i) {
    return _getState (i) == StepState.complete;
  }

  int currentStep = 0;
  bool complete = false;



  next() {
    // setState(() {
    //   currentStep++;
    // });

    currentStep + 1 != spr.length
        ? setState(() => currentStep++)
        : setState (() => complete = true);
  }

  cancel() {
    if(currentStep > 0) {
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
          title: Text('Work Order Process'),
        ),
        body: Column(
            children: <Widget>[
        complete ? Expanded(
        child: Center(
        child: AlertDialog(
        title: new Text("Work Order Complete"),
      content: new Text(
        "Tada!",
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("Close"),
          onPressed: () {
            setState(() => complete = false);
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
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: (step) => goTo(step)),
            ),
           ]),
    floatingActionButton: FloatingActionButton (
      child: Icon (Icons.list),

    ),);
  }
}