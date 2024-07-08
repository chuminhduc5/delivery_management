class ApiDelivery {
  // TODO: Config API
  // Auth - Đăng nhập
  static const POST_AUTH_LOGIN = 'http://apis-dev.hacom.local/api-master/api/v1/Auth/login';

  // Delivary - Giao vận
  static const GET_LIST_DELIVERY = 'http://192.168.68.201:5001/api/v1/TblDelivery/get-list?Take=5';

  // Technique - Kĩ thuật
  static const GET_LIST_TECHNIQUE = 'http://192.168.68.201:5001/api/v1/TblTestingTechniqueHeader/get-list?Take=8';

  // Delivery Status - Trạng thái giao vận
  static const GET_ALL_DELIVERY_STATUS = 'http://apis-dev.hacom.local/api-mdm/api/v1/TblDmDeliveryStatus/get-all';
  static const POST_UPDATE_STATUS = 'http://192.168.68.201:5001/api/v1/TblDelivery/update-status';
}