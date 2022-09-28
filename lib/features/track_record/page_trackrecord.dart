import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PageTrackrecord extends GetView<ControllerTrackrecord> {
  const PageTrackrecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff5C94E8),
        title: const Text(
          'Track Record',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: 'ComicSans'),
        ),
      ),
      body: Obx(() => RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
        },
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 120,
              decoration: const BoxDecoration(
                  color: Color(0xff5C94E8),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => controller.selectedDateOne(context),
                        child: Container(
                          height: 40,
                          width: 95,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
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
                          color: Colors.white,
                          height: 40,
                          width: 95,
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
                          margin: const EdgeInsets.only(top: 20),
                          height: 40,
                          width: 55,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          alignment: Alignment.center,
                          child: const Icon(
                            CupertinoIcons.search,
                            color: Color(0xff5C94E8),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Pastikan tanggal sudah benar ya',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'ComicSans'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.trackRecordList.length,
                    padding: EdgeInsets.only(left: 30, right: 15),
                    itemBuilder: (context, index)=>
                        GestureDetector(
                          onTap: ()=> Get.snackbar(
                              'Mobile Presence',
                              'This is just sample',
                              snackPosition: SnackPosition.BOTTOM
                          ),
                          child: SizedBox(
                            height: 140,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              isFirst: index == 0 ? true : false,
                              isLast: index == controller.trackRecordList.length -1 ? true : false,
                              indicatorStyle: IndicatorStyle(
                                  height: 12,
                                  width: 12,
                                  color: Color(0xff5C94E8)
                              ),
                              beforeLineStyle: LineStyle(
                                  color: Color(0xff5C94E8),
                                  thickness: 2
                              ),
                              endChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 55, 0, 0),
                                    child: Text(
                                      DateFormat('dd/MM/yyyy').format(controller.trackRecordList[index].date!),
                                      style: GoogleFonts.comicNeue(
                                          fontSize: index == 0 ? 20 : 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 5, 60, 0),
                                    child: Text(
                                      controller.trackRecordList[index].location ?? 'Unknown',
                                      style: GoogleFonts.comicNeue(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                )
            ),
          ],
        ),
      )),
    );
  }
}
