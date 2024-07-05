# delivery_management
App quản lý giao vận

### BLoc
- sign_in_bloc: Quản lý trạng thái đăng nhập
- delivery_bloc: Quản lý trạng thái khi lấy dữ liệu giao vận qua API
- technique_bloc: Quản lý trạng thái khi lấy dữ liệu danh sách đơn hàng kiểm tra kĩ thuật qua API

### Screen
- home_screen: Màn trang chủ
- order_screen: Màn đơn hàng
- delivery_screen: Màn giao vận
- technique_screen: Màn kĩ thuật
- report_screen: Màn báo cáo
- setting_screen: Màn cài đặt
- perform_delivery_screen: Màn thực hiện giao vận

### Service
- auth_service: Xử lý call API và lưu token sau khi đăng nhập thành công
- delivery_service: Xử lý call API giao vận
- technique_service: Xử lý call API d*anh sách đơn hàng kiểm tra kĩ thuật
### Widget
- delivery_order_list_widget: Danh sách đơn giao hàng
- order_detail_widget: Chi tiết đơn hàng
