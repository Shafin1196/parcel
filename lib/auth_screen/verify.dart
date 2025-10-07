
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/auth_screen/reset_password.dart';
import 'package:parcel/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtp extends ConsumerStatefulWidget {
  const VerifyOtp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends ConsumerState<VerifyOtp> {
  var seconds=60;
  var message="Resend in ";
  Timer? _timer;
  bool _timerOn=true;
  var _otp="";
  @override
  void initState(){
    super.initState();
    startTimer();
    
  }
  @override
  void dispose(){
    super.dispose();
    _timer?.cancel();
  }
  void startTimer(){
    _timer=Timer.periodic(Duration(seconds: 1), (timer){
      if(seconds>0){
        setState(() {
        seconds--;
      });
      }
      else{
        timer.cancel();
        setState(() {
          message="Resend ";
          _timerOn=false;
        });
      }
    });
  }

  void verifyButton(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx)=>ResetPassword()));
  }
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          height: _screenHeight,
          width: double.infinity,
          child: Column(
            children: [
              text(
                "Verify OTP",
                Color(0xff139F25),
                true,
                _screenHeight,
                0.035,
              ),
              SizedBox(height: _screenHeight * .02),
              text(
                "Enter your OTP which has been sent to your phone and completely verify your account.",
                Color(0xff757575),
                false,
                _screenHeight,
                0.035,
              ),
              SizedBox(height: _screenHeight * .04),
              // pin code here
              PinCodeTextField(
                appContext: context, 
                length: 4,
                onChanged: (value) {
                  _otp=value;
                },
                textStyle: TextStyle(),
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: _screenHeight*0.07,
                  fieldWidth: _screenHeight*0.07,
                  activeColor: Color(0xffd7d7d7),
                  activeFillColor: Color(0xffd7d7d7),
                  inactiveColor: Color(0xffd7d7d7),
                  inactiveFillColor: Color(0xffd7d7d7),
                  selectedColor: Color(0xffd7d7d7),
                  selectedFillColor: Color(0xffd7d7d7),
                  borderWidth: 0.5,
                ),
              ),
              SizedBox(height: _screenHeight * .04),
              text("A code has been sent to your phone number", Colors.black, false, _screenHeight, 0.035),
              SizedBox(height: _screenHeight * .005),
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: !_timerOn?(){
                    setState(() {
                      _timerOn=true;
                      message="Resend in ";
                      seconds=60;
                    });
                    startTimer();
                  }:null, 
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  child: text(message=="Resend "?message:"${message} 00: ${seconds.toString()}",Color(0xff139f25) , true, _screenHeight/1.8, 0.0),
                  ),
                ],
              ),
              buttons(_screenHeight, Color(0xff139F25), Colors.white, _screenWidth, "Verify", ()=>verifyButton(context))
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: Color(0xffd7d7d7)),
    );
  }
}