import 'package:flutter/cupertino.dart';

class WorkOrderStep {
  int index;
  String stepTitle;
  String stepSubTitle;
  Widget stepContent;

  WorkOrderStep(
      this.index, this.stepTitle, this.stepSubTitle, this.stepContent);
}
