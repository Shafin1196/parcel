

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/auth_screen/auth_widgets/sign_in_form.dart';
import 'package:parcel/auth_screen/auth_widgets/text_with_button.dart';
import 'package:parcel/auth_screen/forget.dart';
import 'package:parcel/constants.dart';
import 'package:parcel/providers/sign_in_provider.dart';

class SignIn extends ConsumerWidget {
  SignIn({super.key});
  final _formKey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  void _signIn(BuildContext ctx){
    //functions will add here later
  }
  void forgetButtonPress(BuildContext ctx,WidgetRef ref){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx)=> ForgetScreen()));
    ref.read(passShow.notifier).state=true;
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screenHeight=MediaQuery.of(context).size.height;
    final _screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _screenHeight,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: _screenHeight*.05,),
                text("Welcome Back", Color(0xff139F25), true, _screenHeight,0.035),
                SizedBox(height: _screenHeight*.02,),
                text("Log in to continue shopping and enjoy personalized offers", 
                Color(0xff757575), 
                false, 
                _screenHeight,
                0.035
                ),
                SizedBox(height: _screenHeight*.04,),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: SignInForm(formKey: _formKey,passwordController: _passwordController,emailController: _emailController,)),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: TextButton(
                    onPressed: (){
                    forgetButtonPress(context,ref);
                  }, 
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    
                  ),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Color(0xff139f25),
                      fontSize: _screenHeight*0.015,
                    ),
                  ),
                  ),
                ),
                buttons(_screenHeight, Color(0xff139F25),Colors.white, _screenWidth, "Sign In", ()=>_signIn(context)),
                SizedBox(
                  height: _screenHeight*0.01,
                ),
                text("or", Colors.black, false, _screenHeight*1.7,0.035),
                buttons(_screenHeight,Colors.white, Colors.black ,_screenWidth, "Continue with Google", ()=>_signIn(context),Image.asset("assets/google.png")),
                TextAndButton(),
              ],
          
            ),
          ),
        )
        ),
    );
  }
}