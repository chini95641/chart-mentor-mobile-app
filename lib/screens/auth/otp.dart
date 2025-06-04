import 'package:another_telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  String verificationid, number;

  OtpScreen({super.key, required this.verificationid, required this.number});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Telephony telephony = Telephony.instance;
  String recieveText = '';
  String otp = '';
  List<TextEditingController?> otpControllers = [];
  void readSms() {
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          if (message.body!.contains('pattykulcha')) {
            String otpnew = message.body!.substring(0, 6);
            setState(() {
              recieveText = otpnew;
              otp = otpnew;
              for (int i = 0;
                  i < otpnew.length && i < otpControllers.length;
                  i++) {
                otpControllers[i]?.text = otpnew[i];
              }
            });
          }
        },
        listenInBackground: false);
  }

  //int time = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readSms();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('Verify')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: const Text(
                  'Verify Mobile Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Check your SMS messages. We’ve sent you thePIN at \n at ${widget.number}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.start,
                fieldWidth: widths * .2,
                numberOfFields: 4,
                fillColor: Colors.blue,

                handleControllers: (controllers) {
                  otpControllers = controllers;
                },
                borderColor: Colors.blue,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  print(code);

                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  otp = verificationCode;
                }, // end onSubmit
              ),
              SizedBox(
                height: 25,
              ),
              // Container(
              //   height: heights * .06,
              //   width: widths * .9,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5), color: Colors.blue),
              //   child: Center(
              //       child: Text(
              //     'Verify',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //     ),
              //   )),
              // ),

              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                        ),
                        child: SizedBox(
                          height: heights *
                              .4, // Adjust height as needed to reach just above "Resend Code"
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  "Chart mentor would like to allow push notifcations?",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: heights * .06,
                                width: widths * .9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue),
                                child: const Center(
                                  child: Text(
                                    'Allow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: Text(
                                  'Dont Allow',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: heights * .06,
                  width: widths * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Don’t receive SMS?'),
                  Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
