import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Step 1: Define the events
abstract class SignUpEvent {}

class NameChanged extends SignUpEvent {
  final String name;

  NameChanged(this.name);
}

class PhoneNumberChanged extends SignUpEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);
}

class AddressChanged extends SignUpEvent {
  final String address;

  AddressChanged(this.address);
}


