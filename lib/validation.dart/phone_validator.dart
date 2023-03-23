class Validations {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    } else if (!value.startsWith('0')) {
      return 'Số điện thoại không hợp lệ';
    } else if (value.length < 10) {
      return 'Số điện thoại phải có ít nhất 10 số';
    }
    return null;
  }
}
