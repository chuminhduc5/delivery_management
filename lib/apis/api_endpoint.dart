class ApiEndpoint {
  static const String baseUrl = 'http://192.168.50.187:5001';
  // TODO: Config API
  // Auth - Đăng nhập
  static const String POST_AUTH_LOGIN = 'http://apis-pos-dev.hacom.vn/api-master/api/v1/Auth/login';

  // Delivary - Giao vận
  static const String GET_LIST_DELIVERY = '$baseUrl/api/v1/TblDelivery/get-list?Take=5';

  // Technique - Kĩ thuật
  static const String GET_LIST_TECHNIQUE = '$baseUrl/api/v1/TblTestingTechniqueHeader/get-list?Take=8';

  // Delivery Status - Trạng thái giao vận
  static const String GET_DELIVERY_STATUS = 'http://apis-pos-dev.hacom.vn/api-mdm/api/v1/TblDmDeliveryStatus/get-list?Take=8';
  static const String POST_UPDATE_STATUS = '$baseUrl/api/v1/TblDelivery/update-status';

  // Reason Return - Lý do trả hàng
  static const String GET_REASON_RETURN = 'http://apis-pos-dev.hacom.vn/api-mdm/api/v1/TblDmReasonReturn/get-all';
}