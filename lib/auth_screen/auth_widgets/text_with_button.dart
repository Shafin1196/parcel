
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/constants.dart';

class TextAndButton extends ConsumerWidget {
  const TextAndButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screenHeight=MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text("Don't have an account?",  Color(0xff757575), false, _screenHeight,0.01),
        TextButton(onPressed: (){
          
        }, 
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        child: text("Create Account", Color(0xff139F25), true, _screenHeight/2.1,0)
        ),
      ],
    );
  }
}