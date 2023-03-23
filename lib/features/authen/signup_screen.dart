import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cb/features/authen/signin_screen.dart';
import 'package:flutter_cb/validation.dart/phone_validator.dart';

import '../../domain/bloc/signup/signup_bloc.dart';
import '../../domain/bloc/signup/signup_event.dart';
import '../../domain/bloc/signup/signup_state.dart';
import '../../utility/local_data.dart';

class SignUpInitial extends SignUpState {}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String phoneNumb = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(NameChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                      ),
                      // function validate phone number
                      validator: Validations.validatePhoneNumber,
                      onChanged: (text) {
                        phoneNumb = text;
                        context
                            .read<SignUpBloc>()
                            .add(PhoneNumberChanged(text));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Address',
                      ),
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(AddressChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    SaveData.userPhoneNumb = phoneNumb;
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    } else {}

                    // Handle sign up button pressed
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
