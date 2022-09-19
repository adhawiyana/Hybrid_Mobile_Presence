import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/absence/page_absence.dart';
import 'package:tester_app/features/home/page_home.dart';
import 'package:tester_app/features/profile/page_profile.dart';
import 'package:tester_app/features/track_record/page_trackrecord.dart';

class ControllerMain extends GetxController{
  late PageController pageController;
  var currentPage = 0.obs;
  final List<Widget> pages = [
    const PageHome(),
    const PageAbsence(),
    const PageTrackrecord(),
    const PageProfile(),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  @override
  void onReady() {
    super.onReady();
    var pageArg = Get.arguments;
    if (pageArg != null) {
      changePage(pageArg);
      pageController.jumpToPage(pageArg);
    }
  }

  void changePage(index) => currentPage.value = index;


}