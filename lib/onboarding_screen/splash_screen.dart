import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/constants.dart';
import 'package:parcel/onboarding_screen/boarding_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context)=> BoardingScreen()
          )
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff139f25),
      body: Center(
        child: CircleAvatar(
          radius: 96,
          backgroundColor: Colors.white,
          child: Center(child: Text("logo",style: logoText,)),
        ),
      ),
    );
  }
}