import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/main/controller_main.dart';

class PageMain extends GetView<ControllerMain>{
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
        index: controller.currentPage.value,
        children: controller.pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
          )]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue.shade300,
            currentIndex: controller.currentPage.value,
            onTap: (index)=> controller.changePage(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.device_desktop),
                  label: 'Home',
                  backgroundColor: Color(0xff7D7D7D)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Absence',
                  backgroundColor: Color(0xff7D7D7D)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.doc),
                  label: 'Track Record',
                  backgroundColor: Color(0xff7D7D7D)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'Profle',
                  backgroundColor: Color(0xff7D7D7D)),
            ],
          ),
        ),
      ),
    ));
  }
}