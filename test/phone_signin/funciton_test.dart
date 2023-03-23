import 'package:flutter_cb/validation.dart/phone_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validatePhoneNumber', () {
    // Test validator with null value
    test('empty input', () {
      final result = Validations.validatePhoneNumber('');
      expect(result, 'Vui lòng nhập số điện thoại');
    });
    // Test validator with invalid value
    test('less than 10 digits', () {
      final result = Validations.validatePhoneNumber('123456789');
      expect(result, 'Số điện thoại phải có ít nhất 10 số');
    });
    // Test validator with value not starting with '0'
    test('not starting with 0', () {
      final result = Validations.validatePhoneNumber('1234567890');
      expect(result, 'Số điện thoại không hợp lệ');
    });

    test('valid phone number', () {
      final result = Validations.validatePhoneNumber('0123456789');
      expect(result, null);
    });
  });
}
