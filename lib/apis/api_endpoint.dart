class ApiEndpoint {
  static const String authUrl = 'http://apis-pos-dev.hacom.vn/api-master';
  static const String baseUrl = 'http://apis-pos-dev.hacom.vn/api-shipping';
  static const String mdmUrl = 'http://apis-pos-dev.hacom.vn/api-mdm';
  // TODO: Config API
  // Auth - Đăng nhập
  static const String POST_AUTH_LOGIN = '$authUrl/api/v1/Auth/login';

  // Delivary - Giao vận
  static const String GET_LIST_DELIVERY = '$baseUrl/api/v1/TblDelivery/get-list?Take=5';

  // Technique - Kĩ thuật
  static const String GET_LIST_TECHNIQUE = '$baseUrl/api/v1/TblTestingTechniqueHeader/get-list?Take=15';

  // Delivery Status - Trạng thái giao vận
  static const String GET_DELIVERY_STATUS = '$mdmUrl/api/v1/TblDmDeliveryStatus/get-select';
  static const String POST_UPDATE_STATUS = '$baseUrl/api/v1/TblDelivery/update-status';

  // Reason Return - Lý do trả hàng
  static const String GET_REASON_RETURN = '$mdmUrl/api/v1/TblDmReasonReturn/get-all';

  // Branch - Chi nhánh
  static const String GET_BRANCH = '$mdmUrl/api/v1/TblDmBranch/get-all';
}