import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester_app/features/absence_success/controller_absencesuccess.dart';

class PageAbsenceSuccess extends GetView<ControllerAbsenceSuccess>{
  const PageAbsenceSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6496E6),
      body: Obx(() => Center(
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
                        Icons.thumb_up_alt_rounded,
                        size: 65,
                        color: Color(0xff6496E6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        "Data kegiatan anda berhasil diperbarui",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 18),
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
                      "Terima kasih sudah bekerja dengan baik. Selamat beristirahat, jangan lupa bahagia :)",
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
                      controller.detail.value.location ?? "",
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
                      const SizedBox(width: 50),
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      controller.detail.value.post ?? "-",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                    child: ElevatedButton(
                        onPressed: ()=> Get.back(),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize: Size(Get.width, 40),
                            backgroundColor: const Color(0xff969696),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                        child: Text(
                          'Absen sudah diterima',
                          style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18
                              )
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
      )
    );
  }
}