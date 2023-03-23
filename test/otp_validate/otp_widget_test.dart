import 'package:flutter/material.dart';
import 'package:flutter_cb/features/authen/otp_screen.dart';
import 'package:flutter_cb/features/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Can enter OTP code', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: OtpScreen(),
      ),
    );
    final otpField = find.byKey(ValueKey('otpTextField'));
    await tester.enterText(otpField, '123456');
    expect(find.text('123456'), findsOneWidget);
  });

//Test case cho trường hợp nhập đúng OTP code và bấm nút xác thực:
  testWidgets('Verify OTP with valid code', (WidgetTester tester) async {
    // Set up
    final String validOTP = '123456';
    await tester.pumpWidget(
      MaterialApp(
        home: OtpScreen(),
      ),
    );

    // Tap the text field to enter the OTP code
    final otpTextField = find.byKey(ValueKey('otpTextField'));
    await tester.tap(otpTextField);

    // Enter the valid OTP code
    await tester.enterText(otpTextField, validOTP);

    // Tap the verify button
    final verifyButton = find.byKey(ValueKey('verifyButton'));
    await tester.tap(verifyButton);

    // Wait for the navigation to the next screen
    await tester.pumpAndSettle();

    // Expect to navigate to the next screen
    expect(find.byType(HomeScreen), findsOneWidget);
  });

// //Test case cho trường hợp nhập sai OTP code và bấm nút xác thực:

//   testWidgets('Verify OTP with invalid code', (WidgetTester tester) async {
//     // Set up
//     final String invalidOTP = '111111';
//     await tester.pumpWidget(
//       MaterialApp(
//         home: OtpScreen(),
//       ),
//     );

//     // Tap the text field to enter the OTP code
//     final otpTextField = find.byKey(ValueKey('otpTextField'));
//     await tester.tap(otpTextField);

//     // Enter the invalid OTP code
//     await tester.enterText(otpTextField, invalidOTP);

//     // Tap the verify button
//     final verifyButton = find.byKey(ValueKey('verifyButton'));
//     await tester.tap(verifyButton);

//     // Expect to see the error message
//     // thử find widget bằng VlueKey
//     final errorMessage = find.byKey(ValueKey('errorMessage'));
//     //final errorMessage = find.text('Invalid OTP code');
//     expect(errorMessage, findsOneWidget);

//     expect(find.text('Invalid OTP code'), findsOneWidget);
//     expect(find.text('Please enter OTP code'), findsNothing);

//     // Wait for the error message to disappear
//     await tester.pumpAndSettle(const Duration(seconds: 2));

//     // Expect to still be on the same screen
//     expect(find.byType(OtpScreen), findsOneWidget);
//   });


// //Test case cho trường hợp không nhập OTP code và bấm nút xác thực:

//   testWidgets('Verify OTP with empty code', (WidgetTester tester) async {
//     // Set up
//     await tester.pumpWidget(
//       MaterialApp(
//         home: OtpScreen(),
//       ),
//     );

//     // Tap the verify button without entering an OTP code
//     final verifyButton = find.byKey(ValueKey('verifyButton'));
//     await tester.tap(verifyButton);

//     // Expect to see the error message
//     final errorMessage = find.text('Please enter OTP code');
//     expect(errorMessage, findsOneWidget);

//     // Wait for the error message to disappear
//     await tester.pumpAndSettle(const Duration(seconds: 2));

//     // Expect to still be on the same screen
//     expect(find.byType(OtpScreen), findsOneWidget);
//   });
 }
