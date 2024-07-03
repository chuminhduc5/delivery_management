class OrderData{
  int stt;
  String orderNumber;
  String date;
  String branch;
  String status;

  OrderData(
      this.stt, this.orderNumber, this.date, this.branch, this.status);
}

final List<OrderData> orderList = [
  OrderData(1, 'K01-OD-240200087', '05/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
  OrderData(2, 'K01-OD-240200056', '05/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
  OrderData(3, 'K01-OD-240200100', '05/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
  OrderData(4, 'K01-OD-240200103', '05/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
  OrderData(5, 'K01-OD-240200057', '05/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
  OrderData(6, 'K01-OD-240200128', '16/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
  OrderData(7, 'K01-OD-240200141', '16/02/2024', 'Kho tổng Hai Bà Trưng', 'Kho hoàn thành'),
  OrderData(8, 'K01-OD-240200144', '19/02/2024', 'Kho tổng Hai Bà Trưng', 'Chờ xuất hàng'),
];