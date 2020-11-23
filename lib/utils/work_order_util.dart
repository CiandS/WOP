class WorkOrderUtil {
  static WorkOrderUtil _instance;

  WorkOrderUtil._();

  static WorkOrderUtil get getInstance =>
      _instance = _instance ?? WorkOrderUtil._();

  int getQuantityProcessedPercentage(double quantityProcessedValue) {
    int quantityParsed = (quantityProcessedValue * 10).toInt();
    return quantityParsed;
  }
}
