import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cb/features/authen/signup_screen.dart';
import 'package:flutter_cb/validation.dart/phone_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utility/local_data.dart';
import 'otp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String phoneNumb = '';
  String phoneAssociated = '0379318642';
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Đăng nhập',
                      style: GoogleFonts.titilliumWeb(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 5),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                                style: TextStyle(fontSize: 18),
                                onChanged: (text) {
                                  phoneNumb = text;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black87),
                                  ),
                                  hintText: ("Nhập số điện thoại"),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: Validations.validatePhoneNumber)),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                onPressed: () {
                                  SaveData.userPhoneNumb = phoneNumb;
                                  if (_formKey.currentState!.validate()) {
                                    if (phoneNumb == phoneAssociated) {
                                      SaveData.userPhoneNumb = phoneNumb;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OtpScreen()),
                                      );
                                    } else {
                                      _dialogBuilder(context);
                                    }
                                  }
                                },
                                child: const Text("Tiếp theo"))),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Phone Number is not Associated'),
          content: Text(
              'A phone number ${SaveData.userPhoneNumb} is not Associated. Do you want to create an account with this phone number? .'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text("No i don't"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes let me in'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}
