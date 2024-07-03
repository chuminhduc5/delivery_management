
class DeliveryOrderData {
  String stt;
  String deliveryOrderNumber;
  String status;

  DeliveryOrderData(this.stt, this.deliveryOrderNumber, this.status);
}

final List<DeliveryOrderData> deliveryOrderList = [
  DeliveryOrderData('1', 'K01-OD-24040067', 'Kho hoàn thành'),
  DeliveryOrderData('2', 'K01-OD-24040071', 'Chờ xuất kho'),
];