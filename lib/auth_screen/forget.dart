import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/auth_screen/verify.dart';
import 'package:parcel/constants.dart';

class ForgetScreen extends ConsumerWidget {
  ForgetScreen({super.key});
  final _phoneController = TextEditingController();
  void confirmButton(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx)=>VerifyOtp()));
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                "Forgot Password",
                Color(0xff139F25),
                true,
                _screenHeight,
                0.035,
              ),
              SizedBox(height: _screenHeight * .02),
              text(
                "Enter the phone number associated with your account and we’ll send you OTP to reset your password",
                Color(0xff757575),
                false,
                _screenHeight,
                0.035,
              ),
              SizedBox(height: _screenHeight * .04),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _screenHeight * 0.018,
                  ),
                ),
              ),
              SizedBox(height: _screenHeight * 0.005),
              Align(
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hint: Text(
                      "Ex: +980010101010",
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: _screenHeight * .015,
                      ),
                    ),
                    border: outlineBorder(),
                    focusedBorder: outlineBorder(),
                    enabledBorder: outlineBorder(),
                  ),
                ),
              ),
              SizedBox(
                  height: _screenHeight*0.01,
                ),
              buttons(_screenHeight, Color(0xff139F25), Colors.white, _screenWidth, "Confirm", ()=>confirmButton(context))
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
