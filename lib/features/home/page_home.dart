import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester_app/features/home/controller_home.dart';

class PageHome extends GetView<ControllerHome>{
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      body: Obx(() => RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
          controller.controllerGlobalUser.user.refresh();
          controller.location();
        },
        child: SingleChildScrollView(
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
                        'Selamat datang',
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
                        controller.controllerGlobalUser.user.value.name ?? 'Username',
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
                      "assets/icons/desk_icon.png",
                      height: 220,
                      width: Get.width,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: controller.locationSwitch.value == false ? 120 : 65,
                      width: Get.width,
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 16),
                                      child: Text(
                                        'Lokasi saat ini',
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
                                        controller.locationSwitch.value == false ? 'Off-site' : 'On-site',
                                        style: GoogleFonts.nunito(
                                            textStyle: const TextStyle(
                                                fontSize: 14
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: FlutterSwitch(
                                      width: 50,
                                      padding: 1,
                                      height: 25,
                                      value: controller.locationSwitch.value,
                                      onToggle: (value)=> controller.locationSwitch(value)
                                  ),
                                ),
                                const SizedBox(width: 16)
                              ],
                            ),
                            Visibility(
                              visible: controller.locationSwitch.value == false ? true : false,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '117.123456, -0.123456',
                                    contentPadding: const EdgeInsets.only(left: 16, top: 14),
                                    prefixIcon: Icon(CupertinoIcons.location_solid, color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 250,
                      width: Get.width,
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 16),
                                  child: Text(
                                    'Selasa, 04 Oktober 2022',
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
                                  child: Text(
                                    '09:00',
                                    style: GoogleFonts.nunito(
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: 'Tulis agenda'
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: Size(Get.width, 40),
                                    backgroundColor: const Color(0xff6496E6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                  child: const Text('Chck in')
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}