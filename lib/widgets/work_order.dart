import 'package:flutter/material.dart';

class WorkOrderPage extends StatefulWidget {
  @override
  _WorkOrderPageState createState() => new _WorkOrderPageState();
}

class _WorkOrderPageState extends State<WorkOrderPage> {
  List<Step> steps = [
    Step(
      title: const Text('Test Step #1'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Username (test)'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password (test)'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Step #2'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),

    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),

    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),

    Step(
      state: StepState.error,
      title: const Text('Avatar'),
      subtitle: const Text("Error!"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState (() => complete = true);
  }

  cancel() {
    if(currentStep > 0) {
      goTo(currentStep - 1);
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
        body: Column(children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: (step) => goTo(step)),
            ),
  ],
        ));
  }
}