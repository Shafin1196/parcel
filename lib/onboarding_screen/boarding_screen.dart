import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/auth_screen/sign_in.dart';
import 'package:parcel/auth_screen/sign_up.dart';
import 'package:parcel/onboarding_screen/onbording_widgets/pagination.dart';

class BoardingScreen extends ConsumerWidget {
  const BoardingScreen({super.key});
  void signInPressed(BuildContext ctx){
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>SignIn()));
  }
  void signUpPressed(BuildContext ctx){
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>SignUp()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screenHeight=MediaQuery.of(context).size.height;
    final _screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pagination here
            ImagePagination(),
            //buttons here
            buttons(_screenHeight,Color(0xff139F25),Colors.white, _screenWidth,"Sign Up",()=>signUpPressed(context)),
            buttons(_screenHeight, Colors.white, Colors.black, _screenWidth, "Sign In",()=>signInPressed(context)),
          ],
        ),
      ),
    );
  }

  Padding buttons(double _screenHeight,Color bgColor ,Color txColor, double _screenWidth,String text,VoidCallback pressed) {
    return Padding(
          padding: EdgeInsets.only(top: _screenHeight*.02),
          child: Center(
            child: SizedBox(
              height: _screenHeight/16,
              width: _screenWidth*.84,
              child: ElevatedButton(onPressed: (){
                pressed();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: bgColor, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Color(0xff139F25),
                    width: 1,
                  ),
                ),
              ),
              child: Text(text,
              style: TextStyle(
                color: txColor,
                fontSize: 21
              ),
              ),
              ),
            ),
          ),
        );
  }
}