import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/home/controller_home.dart';

class PageHome extends GetView<ControllerHome>{
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
          controller.controllerGlobalUser.user.refresh();
          controller.location();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 60),
                child: Text(
                  'Check In',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue.shade500,
                      fontFamily: 'ComicSans'
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  'Selamat datang, ${controller.controllerGlobalUser.user.value.name}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff575757),
                      fontWeight: FontWeight.w200
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/icons/desk_icon.png',
                  width: Get.width * 0.55,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.grey.shade300,
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Lokasi saya di ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto"),
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: 0,
                            groupValue: controller.locationSelected.value,
                            onChanged: (value) => controller.locationSelected.value = 0),
                        const Text('Offsite')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: 1,
                            groupValue: controller.locationSelected.value,
                            onChanged: (value) => controller.locationSelected.value = 1),
                        const Text('Onsite')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 70,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 30.0.w, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    ),
                    child: const Text('1/1/2022', style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    height: 40,
                    width: 70,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    ),
                    child: const Text('09.00', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 150,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
                ),
                margin: const EdgeInsets.only(left: 30, right: 30),
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextField(
                  controller: controller.edtAct,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Jadi apa kegiatan kamu hari ini?'
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 50,
                  width: Get.width * 0.8,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xff5C94E8),
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.grey.shade200,
                        )
                      ]
                  ),
                  child: const Text(
                    'Check In',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'ComicSans'),
                  ),
                ),
              ),
            )
          ],
        ),
      )
      ),
    );
  }
}