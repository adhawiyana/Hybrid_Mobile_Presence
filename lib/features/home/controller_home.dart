import 'dart:developer' as log;
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:tester_app/features/home/api_home.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerHome extends GetxController {
  final ApiHome api;

  ControllerHome({required this.api});

  var loading = false.obs;
  var locationSwitch = true.obs;

  var locationSelected = 0.obs;
  var edtAct = TextEditingController();

  var lat = 0.0.obs;
  var long = 0.0.obs;

  var dateTime = DateTime.now();
  var liveLat = 0.0.obs;
  var liveLng = 0.0.obs;
  var date = "".obs;
  var checkinTime = "".obs;

  var distance = 0.0.obs;

  var controllerGlobalUser = Get.find<ControllerGlobalUser>();

  Location locationService = Location();

  final formkeyAct = GlobalKey<FormState>();


  @override
  void onInit() async {
    location();
    locationPermit();
    locationListen();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtAct.dispose();
  }

  location() async {
    try {
      loading(false);
      var getLocationResponse = await api.getLocation();
      if (getLocationResponse != null) {
        lat.value = getLocationResponse["location"][0]["latitude"];
        long.value = getLocationResponse["location"][0]["longitude"];
      }
      loading(false);
    } catch (e) {
      loading(false);
      log.log(e.toString());
    }
  }

  locationPermit() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationService.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await locationService.getLocation();
  }

  locationListen() {
    locationService.onLocationChanged.listen((LocationData currentLocation) {
      liveLat.value = currentLocation.latitude!;
      liveLng.value = currentLocation.longitude!;
    });
  }

  //return in Meters
  locationDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    // return 12742 * asin(sqrt(a));
    distance.value = 1000 * 12742 * asin(sqrt(a));
  }

  presencePopUp(){
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(0),
        radius: 10,
        title: "",
        content: Column(
          children: <Widget>[
            const Icon(CupertinoIcons.hand_thumbsup_fill,
                size: 50, color: Color(0xff6496E6)),
            const SizedBox(height: 10),
            Text(
              "Selamat datang, ${controllerGlobalUser.user.value.name}",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text(
              "Absen anda telah masuk, selamat beraktivitas",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  )),
            ),
          ],
        )
    );
  }

  absencePopUp(){
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(0),
        radius: 10,
        title: "",
        content: Column(
          children: <Widget>[
            const Icon(Icons.location_off,
                size: 50, color: Color(0xff6496E6)),
            const SizedBox(height: 10),
            Text(
              "Maaf ${controllerGlobalUser.user.value.name}",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text(
              "Jarak anda selisih ${distance.value} M",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  )),
            ),
          ],
        )
    );
  }

  alreadyAbsencePopUp(){
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(0),
        radius: 10,
        title: "",
        content: Column(
          children: <Widget>[
            const Icon(Icons.location_off,
                size: 50, color: Color(0xff6496E6)),
            const SizedBox(height: 10),
            Text(
              "Maaf ${controllerGlobalUser.user.value.name}",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text(
              "Anda hanya dapat melakukan check in kehadiran sekali",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  )),
            ),
          ],
        )
    );
  }

  inputToast(){
    return Fluttertoast.showToast(
        msg: 'Pastikan anda tidak lupa dengan kegiatan anda'
    );
  }

  checkin()async{
    date.value = DateFormat("yyyy-MM-dd").format(dateTime);
    checkinTime.value = DateFormat("HH:mm:ss").format(dateTime);
    try{
      locationDistance(lat.value, long.value, liveLat.value, liveLng.value);
      if(distance.value <= 50.0){
        var presenceResponse = await api.presence(
            edtAct.text,
            date.value,
            checkinTime.value,
            "00:00:00",
            liveLat.value,
            liveLng.value,
            locationSwitch.value == true ? "On-site" : "Off-site",
            controllerGlobalUser.user.value.idUser ?? 0
        );
        if(presenceResponse["status"] == 200){
          presencePopUp();
        }else{
          alreadyAbsencePopUp();
        }
      }else{
        absencePopUp();
      }
    }catch(e){
      log.log(e.toString());
    }

  }

  checkinOffsite()async{
    date.value = DateFormat("yyyy-MM-dd").format(dateTime);
    checkinTime.value = DateFormat("HH:mm:ss").format(dateTime);
    try{
      var presenceResponse = await api.presence(
          edtAct.text,
          date.value,
          checkinTime.value,
          "00:00:00",
          liveLat.value,
          liveLng.value,
          locationSwitch.value == true ? "On-site" : "Off-site",
          controllerGlobalUser.user.value.idUser ?? 0
      );
      if(presenceResponse["status"] == 200){
        presencePopUp();
      }else{
        alreadyAbsencePopUp();
      }
    }catch(e){
      log.log(e.toString());
    }

  }
}