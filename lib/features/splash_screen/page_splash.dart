import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester_app/features/splash_screen/controller_splash.dart';

class PageSplash extends GetView<ControllerSplash>{
  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/splash_bg.png',
            alignment: Alignment.bottomCenter,
            height: Get.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 70),
                child: Text(
                  'Mobile presence',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  'Every second is count',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}