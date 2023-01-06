import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:tester_app/features/absence/api_absence.dart';
import 'package:tester_app/pages/app_routes.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

import '../../response/detail_track.dart';

class ControllerAbsence extends GetxController{
  final ApiAbsence api;
  ControllerAbsence ({required this.api});

  var loading = false.obs;
  var edtAct = TextEditingController();

  var currLocation = ''.obs;
  var currrTimeArr = ''.obs;
  var currPost  = ''.obs;

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    super.onInit();
    currentPresence();
  }

  @override
  void onClose() {
    super.onClose();
    edtAct.dispose();
  }

  checkOutPopUp(){
    return Get.defaultDialog(
      title: '',
      radius: 12,
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      content: Column(
        children: <Widget>[
          Text(
            "Yakin ingin Check-Out?",
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.w800
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "Pastikan semua pekerjaan anda sudah selesai",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.w300
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                DateFormat("EE, dd MMMM yyyy").format(DateTime.now()),
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              DigitalClock(
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
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black26,
                  width: 1
                )
              )
            ),
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                    onPressed: (){
                      checkingOut();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: Size(Get.width * 0.35, 40),
                        backgroundColor: const Color(0xff6496E6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: Text(
                      'Ya',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16
                          )
                      ),
                    )
                ),
                ElevatedButton(
                    onPressed: ()=> Get.back(),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: Size(Get.width * 0.35, 40),
                        backgroundColor: Colors.transparent,
                        foregroundColor: const Color(0xff6496E6),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0xff6496E6)),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    child: Text(
                      'Tidak',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16
                          )
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  inputPopUp(){
    return Get.defaultDialog(
      title: '',
      radius: 12,
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      content: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Edit Agenda",
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              IconButton(
                  onPressed: ()=> Get.back(),
                  icon: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.black
                  )
              ),
            ],
          ),
          TextField(
            controller: edtAct,
            maxLines: 6,
            decoration: const InputDecoration(
              hintText: "Masukan kegiatan baru anda",
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
            child: ElevatedButton(
                onPressed: (){
                  editingPost();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(Get.width, 40),
                    backgroundColor: const Color(0xff6496E6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                child: Text(
                  'Selesai',
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
      )
    );
  }

  currentPresence()async{
    try{
      loading(true);
      var currentPresenceResponse = await api.todayPresence(
          DateFormat("yyyy-MM-dd").format(DateTime.now()),
          controllerGlobalUser.user.value.idUser ?? 0
      );
      if(currentPresenceResponse != null){
        var response = currentPresenceResponse["detail"];
        var responseKeeper = DetailTrack.fromJson(response);
        currLocation.value = responseKeeper.location ?? "-";
        currrTimeArr.value = responseKeeper.arrivetime ?? "--:--";
        currPost.value = responseKeeper.post ?? "-";
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
      Fluttertoast.showToast(msg: "Ada masih belum melakukan Check-In hari ini");
    }
  }

  checkingOut()async{
    try{
      loading(true);
      var checkingOutResponse = await api.checkOut(
          leavingtime: DateFormat("HH:mm:ss").format(DateTime.now()),
          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
          id_user: controllerGlobalUser.user.value.idUser ?? 0
      );
      if(checkingOutResponse != null){
        Fluttertoast.showToast(msg: checkingOutResponse["Message"]);
        Get.toNamed(Routes.absence_success);
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }

  editingPost()async{
    try{
      loading(true);
      var editingPostResponse = await api.editPost(
          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
          post: edtAct.text,
          id_user: controllerGlobalUser.user.value.idUser ?? 0
      );
      if(editingPostResponse != null){
        Fluttertoast.showToast(msg: editingPostResponse["Message"]);
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}