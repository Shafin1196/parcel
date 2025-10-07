import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagePagination extends StatelessWidget {
  final _pageController = PageController();

  ImagePagination({super.key});
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _screenHeight / 1.5,
          
          child: PageView(
            controller: _pageController,
            children: [
              onBoardColumn(
              "assets/1.png", 
              "Welcome to [App Name],", 
              "Your go-to solution for fast, reliable parcel delivery. Whether you're sending or receiving, we make it easy and quick.",
              _screenHeight
              ),
              onBoardColumn(
                "assets/2.png", 
                "Fast Deliveries, Anytime", 
                "Need a quick delivery? Simply book a ride, and we’ll take care of the rest. Trust us to get your parcels to their destination, safely and on time.",
                _screenHeight
                ),
              onBoardColumn(
                "assets/3.png", 
                "Ready to Deliver?", 
                "Let’s get your parcels moving! With just a few taps, your package is on its way. Speedy, secure, and hassle-free deliveries—every time.",
                _screenHeight
                ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          onDotClicked: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(microseconds: 300),
              curve: Curves.ease,
            );
          },
          effect: WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: Colors.black,
            dotColor: Color(0xffD7D7D7),
          ),
        ),
      ],
    );
  }

  Column onBoardColumn(String imgPath, String title, String body,double height) {
    return Column(
      children: [
        SizedBox(
          height: height*.35, 
          child: Align(
            alignment: Alignment.bottomCenter, 
            child: Image.asset(imgPath, fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: height*.05,),
        Text(title,
        style: TextStyle(
          fontSize: height*.03,
          fontWeight: FontWeight.bold,
          color:Color(0xff139f25),
        ),
        ),
        SizedBox(height: height*.035,),
        Padding(
          padding: EdgeInsets.only(left: height*.035,right:height*.035 ),
          child: Text(body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: height*.015,
            color: Colors.black
          ),
          ),
        ),
      ],
    );
  }
}
