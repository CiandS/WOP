import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:work_order_process/models/work_order.dart';

class WorkOrderProvider extends ChangeNotifier {
  WorkOrder _workOrder = WorkOrder("");

  // UnmodifiableListView<ScrapDetails> get scrapList =>
  //     UnmodifiableListView(_scrapList);

  WorkOrder get getWorkOrder {
    return _workOrder;
  }

  void addWorkOrderNumber(String workOrderNumber) {
    _workOrder.workOrderNumber = workOrderNumber;
    notifyListeners();
  }
}
