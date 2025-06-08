import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp.dart';

class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();
  String number = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('Login')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Enter You Mobile Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                    'Please confirm your county code and enter your mobile number'),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: heights * .09,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: IntlPhoneField(
                    textAlign: TextAlign.center,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    languageCode: "en",
                    onChanged: (phone) {
                      number = phone.completeNumber;
                      print(number);
                      // print(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: heights * .1),
                  child: loading == false
                      ? GestureDetector(
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) return;

                            setState(() {
                              loading = true;
                            });

                            try {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: number,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException ex) {
                                  // Show the error in a snackbar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(ex.message ??
                                            'Verification failed')),
                                  );
                                  setState(() {
                                    loading = false; // allow retry
                                  });
                                },
                                codeSent: (String verificationId, int? token) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                        verificationid: verificationId,
                                        number: number,
                                      ),
                                    ),
                                  );
                                  print('will move to otp screen');
                                },
                                codeAutoRetrievalTimeout: (_) {},
                              );
                            } catch (exception) {
                              print(exception.toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(exception.toString())),
                              );
                              setState(() {
                                loading = false;
                              });
                            }
                          },
                          child: Container(
                            height: heights * .06,
                            width: widths * .9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue),
                            child: Center(
                                child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                          ),
                        )
                      : Container(),
                  // ? Button1(
                  //     ontap: () async {
                  //       // _formKey.currentState?.validate();
                  //       setState(() {
                  //         loading = true;
                  //       });
                  //     //   try {
                  //     //     await FirebaseAuth.instance.verifyPhoneNumber(
                  //     //         phoneNumber: number,
                  //     //         verificationCompleted:
                  //     //             (PhoneAuthCredential credential) {},
                  //     //         verificationFailed:
                  //     //             (FirebaseAuthException ex) {},
                  //     //         codeSent:
                  //     //             (String verifificationid, int? token) {
                  //     //           Navigator.push(
                  //     //               context,
                  //     //               MaterialPageRoute(
                  //     //                 builder: (context) => OtpScreen(
                  //     //                   verificationid: verifificationid,
                  //     //                   number: number,
                  //     //                 ),
                  //     //               ));

                  //     //           print('will move to otp screen');
                  //     //         },
                  //     //         codeAutoRetrievalTimeout: (_) {});
                  //     //   } catch (exception) {
                  //     //     print(exception.toString());
                  //     //     ScaffoldMessenger.of(context)
                  //     //         .showSnackBar(SnackBar(
                  //     //       content: Container(
                  //     //           child: Text(exception.toString())),
                  //     //     ));
                  //     //   }
                  //      },
                  //     buttontext: 'Next')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
