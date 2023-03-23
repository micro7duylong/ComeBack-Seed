import 'package:flutter/material.dart';
import 'package:flutter_cb/features/home_screen.dart';

import '../../utility/local_data.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  String otpTest = '123456';
  String otp = '';
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("OTP Screen")),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      "Điền mã OTP vừa được gửi đến: ${SaveData.userPhoneNumb}"),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  // OtpForm
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey('otpTextField'),
                          onChanged: (text) {
                            otp = text;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                errorMessage = 'Please enter OTP code';
                              });
                              return errorMessage = 'Please enter OTP code';
                            } else if (otp != otpTest) {
                              setState(() {
                                errorMessage = 'Invalid OTP code';
                              });
                              return errorMessage = 'Invalid OTP code';
                            }
                            return errorMessage;
                          },
                          decoration: InputDecoration(
                              labelText: "Enter OTP Code",
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              )),
                        ),
                        SizedBox(height: 10),
                        Text(
                          errorMessage,
                          key: const ValueKey('errorMessage'),
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                  ),
                  ElevatedButton(
                    key: const ValueKey('verifyButton'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        // setState(() {
                        //   errorMessage = 'Invalid OTP code';
                        // });
                      }
                    },
                    child: const SizedBox(
                        height: 40,
                        child: Center(
                            child:
                                Text('Xác thực', textAlign: TextAlign.center))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

void main(List<String> args) {
  print("test");
  print(_OtpScreenState().errorMessage);
}
