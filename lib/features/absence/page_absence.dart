import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/absence/controller_absence.dart';

class PageAbsence extends GetView<ControllerAbsence>{
  const PageAbsence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 60),
                child: Text(
                  'Check Out',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue.shade500,
                      fontFamily: 'ComicSans'
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  'Selamat jalan, Adha',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff575757),
                      fontWeight: FontWeight.w200
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/icons/home_icon.png',
                  width: Get.width * 0.55,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Text(
                  'Terima kasih untuk hari ini! Sebelum anda pergi pastikan anda sudah check out dulu ya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'ComicSans'
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 70,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 39.0.w, top: 10),
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
                  Container(
                    height: 40,
                    width: 70,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    ),
                    child: const Text('17.00', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              Container(
                height: 150,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: const Text(
                  'Implementasi UI pada flutter Menguji API pada fitur Sign in Membuat dokumentasi pada fitur sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: "ComicSans",
                    color: Color(0xff505050),
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 50,
                  width: Get.width * 0.8,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20),
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
                    'Check Out',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'ComicSans'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}