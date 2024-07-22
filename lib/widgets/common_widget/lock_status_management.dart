class LockedStatusManager {
  final Set<int> _lockedStatusIds = {};

  // Thêm trạng thái vào danh sách khóa
  void addLockedStatus(int statusId) {
    _lockedStatusIds.add(statusId);
  }

  // Kiểm tra trạng thái đã bị khóa
  bool isStatusLocked(int statusId) {
    return _lockedStatusIds.contains(statusId);
  }

  // Lấy danh sách các trạng thái đã bị khóa
  List<int> getLockedStatusIds() {
    return _lockedStatusIds.toList();
  }
}
