import 'package:bloc/bloc.dart';
import 'package:flutter_cb/domain/bloc/signup/signup_event.dart';
import 'package:flutter_cb/domain/bloc/signup/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is NameChanged) {
      yield state.copyWith(name: event.name);
    } else if (event is PhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
    } else if (event is AddressChanged) {
      yield state.copyWith(address: event.address);
    }
  }
}