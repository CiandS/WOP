import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:work_order_process/models/work_order_history.dart';

class WorkOrderHistoryProvider extends ChangeNotifier {
  List<WorkOrderHistory> _workOrderHistoryList = [
    WorkOrderHistory(
        "Lot Traveller", DateTime.now(), 'test1234', 10, "Something")
  ];

  UnmodifiableListView<WorkOrderHistory> get workOrderHistoryList =>
      UnmodifiableListView(_workOrderHistoryList);

  bool isWorkOrderStepProcessed(String workOrderTitle) {
    List<WorkOrderHistory> _workOrderHistories = workOrderHistoryList
        .where((workOrderHistory) =>
            workOrderHistory.workOrderHistoryTask == workOrderTitle)
        .toList();

    if (_workOrderHistories.length > 0) {
      return _workOrderHistories.first.workOrderHistoryQty == 10;
    } else {
      return false;
    }
  }

  void addWorkOrderHistory(WorkOrderHistory workOrderHistory) {
    _workOrderHistoryList.add(workOrderHistory);
    notifyListeners();
  }
}
