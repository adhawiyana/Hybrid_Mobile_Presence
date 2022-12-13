import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';

class PageTrackrecord extends GetView<ControllerTrackrecord> {
  const PageTrackrecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          centerTitle: true,
          elevation: 4,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Track Record',
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  Text(
                    'Atur tanggal spesifik',
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black
                        )
                    ),
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => controller.selectedDateOne(context),
                        child: Container(
                          height: 40,
                          width: Get.width * 0.4,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black54, width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          alignment: Alignment.center,
                          child: Text(
                              DateFormat('yyyy-MM-dd').format(controller.date_one.value)
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=> controller.selectedDateTwo(context),
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black54, width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 40,
                          width: Get.width * 0.4,
                          alignment: Alignment.center,
                          child: Text(
                              DateFormat('yyyy-MM-dd').format(controller.date_two.value)
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.trackRecord();
                          // Get.toNamed(Routes.detail_track_record);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, left: 3),
                          decoration: BoxDecoration(
                              color: const Color(0xff5C94E8),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.filter_alt,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  )),
                ]
            ),
          ),
        ),
      ),
      body: Obx(() => RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          controller.trackRecordList.clear();
        },
        child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: ListView.builder(
                itemCount: controller.trackRecordList.length,
                padding: const EdgeInsets.only(left: 15, right: 15),
                itemBuilder: (context, index)=>
                    GestureDetector(
                      onTap: ()=> Get.snackbar(
                          'Mobile Presence',
                          'This is just sample',
                          snackPosition: SnackPosition.BOTTOM
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: index == 0 ? 20 : 0),
                        padding: EdgeInsets.only(bottom: index == 0 ? 20 : 5),
                        decoration: index == 0 ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2,
                                    color: Colors.black38
                                )
                            )
                        ) : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Visibility(
                              visible: index == 0 ? true : false,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  'Hari ini',
                                  style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 4,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 16, top: 16),
                                        width: 70,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff6496E6),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            )
                                        ),
                                        child: Text(
                                          DateFormat("MMM-yyyy").format(controller.trackRecordList[index].date!),
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 10
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 16, bottom: 16),
                                        width: 70,
                                        height: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            border: Border.all(width: 2, color: const Color(0xff6496E6))
                                        ),
                                        child: Text(
                                          DateFormat("dd").format(controller.trackRecordList[index].date!.add(const Duration(days: 1))),
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Check in pada ' + controller.trackRecordList[index].arrivetime!.substring(0, 5),
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.location_on,
                                            size: 20,
                                            color: Color(0xff6496E6),
                                          ),
                                          Text(
                                            controller.trackRecordList[index].location ?? "Uknown",
                                            style: GoogleFonts.nunito(
                                                color: Colors.black,
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
            )
        ),
      )),
    );
  }
}
