class OrderDetailData {
  String id;
  String productCode;
  String productName;
  String unit;
  String quantity;
  String exportWarehouse;

  OrderDetailData(this.id, this.productCode, this.productName, this.unit,
      this.quantity, this.exportWarehouse);
}

final List<OrderDetailData> orderDetailList = [
  OrderDetailData('1', '102.0204.1', 'Mainboard ASROCK B550M PR04', 'CHIEC', '1', 'K01.01.BH01'),
  OrderDetailData('2', '533.2264.33986', 'Dịch vụ sửa chữa máy in tổng thể', 'BO', '1', ''),
];