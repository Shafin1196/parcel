import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/providers/sign_in_provider.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key, required this.formKey,required this.emailController,required this.passwordController});
  final formKey;
  final emailController,passwordController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screenHeight=MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email or Phone Number",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _screenHeight*0.018
            ),
          ),
          SizedBox(
            height: _screenHeight*0.005,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hint: Text("Enter your email address",
              style: TextStyle(
                color: Color(0xff757575),
                fontSize: _screenHeight*.015
              ),
              ),
              border: outlineBorder(),
              focusedBorder: outlineBorder(),
              enabledBorder: outlineBorder(),
              
            ),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(
            height: _screenHeight*0.02,
          ),
          Text(
            "Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _screenHeight*0.018
            ),
          ),
          SizedBox(
            height: _screenHeight*0.005,
          ),
          Consumer(builder: (context,ref,child){
            final _prov=ref.watch(passShow);
            return TextFormField(
            controller: passwordController,
            obscureText: _prov,
            decoration: InputDecoration(
              suffixIcon: _prov?IconButton(onPressed: (){
              ref.read(passShow.notifier).state=!_prov;
              }, 
              icon: Icon(Icons.visibility_off_outlined,color: Color(0xff757575),),
              ):IconButton(onPressed: (){
              ref.read(passShow.notifier).state=!_prov;
              }, 
              icon: Icon(Icons.visibility_outlined,color: Color(0xff757575),),
              ),
              hint: Text("Enter Password",
              style: TextStyle(
                color: Color(0xff757575),
                fontSize: _screenHeight*.015
              ),
              ),
              border: outlineBorder(),
              focusedBorder: outlineBorder(),
              enabledBorder: outlineBorder(),
              
            ),
            validator: (value) {
              return null;
            },
            
          );
          }),
        ],

      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1,color: Color(0xffd7d7d7))
            );
  }
}
