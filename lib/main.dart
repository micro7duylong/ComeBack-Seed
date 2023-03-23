import 'package:flutter/material.dart';

import 'features/authen/signin_screen.dart';
import 'features/home_screen.dart';

/*
- lib/
  - blocs/
    - signup/
      - signup_bloc.dart
      - signup_event.dart
      - signup_state.dart
  - models/
    - user.dart
  - repositories/
    - authentication_repository.dart
  - screens/
    - signup_screen.dart
  - widgets/
    - custom_textfield.dart
*/
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignInScreen(),
  ));
}
