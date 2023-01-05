import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:tester_app/features/absence/controller_absence.dart';

class PageAbsence extends GetView<ControllerAbsence>{
  const PageAbsence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
          controller.currentPresence();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: Get.width,
                    height: Get.height * 0.4,
                    color: const Color(0xff6496E6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 50, 0, 0),
                          child: Text(
                            'Selamat beraktivitas',
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 3, 0, 0),
                          child: Text(
                            controller.controllerGlobalUser.user.value.username ?? "User name",
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 11),
                        Image.asset(
                          "assets/icons/home_icon.png",
                          height: 180,
                          width: Get.width,
                        )
                      ],
                    ),
                  ),
                  controller.currPost.value.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.only(top: 275),
                    child: SizedBox(
                      height: 450,
                      width: Get.width,
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(0.3)))
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16, top: 16),
                                    child: Text(
                                      DateFormat("EE, dd MMMM yyyy").format(DateTime.now()),
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16, top: 16),
                                    child: DigitalClock(
                                      showSecondsDigit: false,
                                      is24HourTimeFormat: true,
                                      areaWidth: 70,
                                      areaHeight: 25,
                                      areaDecoration: const BoxDecoration(
                                          color: Colors.white
                                      ),
                                      hourMinuteDigitTextStyle: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 16),
                              child: Text(
                                "Lokasi",
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                controller.currLocation.value,
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 16),
                              child: Text(
                                'Jam masuk absen',
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                controller.currrTimeArr.value,
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 16),
                              child: Text(
                                'Agenda',
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                controller.currPost.value,
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    )
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: ElevatedButton(
                                  onPressed: ()=> controller.inputPopUp(),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      fixedSize: Size(Get.width, 40),
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: const Color(0xff6496E6),
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 1, color: Color(0xff6496E6)),
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  child: Text(
                                    'Edit Agenda',
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w300
                                        )
                                    ),
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                              child: ElevatedButton(
                                  onPressed: ()=> controller.checkOutPopUp(),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      fixedSize: Size(Get.width, 40),
                                      backgroundColor: const Color(0xff6496E6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                  ),
                                  child: Text(
                                    'Check Out',
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w300
                                        )
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(top: 275),
                    child: SizedBox(
                      height: 450,
                      width: Get.width,
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(0.3)))
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16, top: 16),
                                    child: Text(
                                      DateFormat("EE, dd MMMM yyyy").format(DateTime.now()),
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16, top: 16),
                                    child: DigitalClock(
                                      showSecondsDigit: false,
                                      is24HourTimeFormat: true,
                                      areaWidth: 70,
                                      areaHeight: 25,
                                      areaDecoration: const BoxDecoration(
                                          color: Colors.white
                                      ),
                                      hourMinuteDigitTextStyle: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Lottie.asset(
                              "assets/lottie/nodata_animation.json",
                              height: 350,
                              width: 350
                            ),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Sudah check in? Yuk, cek',
                                    style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.black45
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' di sini',
                                        style: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Color(0xff6496E6)
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => controller.currentPresence(),
                                      )
                                    ]
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}