import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';

class PageDetailtrackrecord extends GetView<ControllerTrackrecord>{
  const PageDetailtrackrecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6496E6),
      body: Center(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.9
            ),
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 5),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.text_bubble,
                        size: 65,
                        color: Color(0xff6496E6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        "Detail kegiatan anda.",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 18, left: 16, right: 16),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black26,
                                width: 1
                            )
                        )
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Berikut adalah detail pekerjaan anda\nJika ada kesalahan silahkan diperbaiki atau hubungi admin pada kantor anda",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Lokasi",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      controller.detail.value.location ?? "Unknown",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 20),
                            child: Text(
                              "Check-In",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              controller.detail.value.arrivetime ?? "--:--",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 20),
                            child: Text(
                              "Check-Out",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              controller.detail.value.leavingtime ?? "--:--",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Agenda",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Text(
                      controller.detail.value.post ?? "-",
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}