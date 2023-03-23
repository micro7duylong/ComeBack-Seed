import 'package:flutter/material.dart';
import 'package:flutter_cb/validation.dart/phone_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('validatePhoneNumber returns correct error messages',
      (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    // Build SignUpScreen widget with a Form containing one TextFormField
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: TextFormField(
            validator: Validations.validatePhoneNumber,
          ),
        ),
      ),
    ));

    // Test validator with null value
    formKey.currentState!.validate();
    await tester.pump();
    expect(find.text('Vui lòng nhập số điện thoại'), findsOneWidget);

    // Test validator with invalid value
    await tester.enterText(find.byType(TextFormField), '0123');
    formKey.currentState!.validate();
    await tester.pump();
    expect(find.text('Số điện thoại phải có ít nhất 10 số'), findsOneWidget);

    // Test validator with value not starting with '0'
    await tester.enterText(find.byType(TextFormField), '9876543210');
    formKey.currentState!.validate();
    await tester.pump();
    expect(find.text('Số điện thoại không hợp lệ'), findsOneWidget);

    // Test validator with valid value
    // await tester.enterText(find.byType(TextFormField), '0123456789');
    // formKey.currentState!.validate();
    // await tester.pump();
    // expect(find.text(''), findsOneWidget);
  });
}
