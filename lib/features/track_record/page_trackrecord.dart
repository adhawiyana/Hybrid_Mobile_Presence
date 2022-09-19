import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';
import 'package:tester_app/pages/app_routes.dart';

class PageTrackrecord extends GetView<ControllerTrackrecord>{
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
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'ComicSans'
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
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
                )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 95,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '1/1/2022'
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
                        color: Colors.white,
                        height: 40,
                        width: 95,
                        alignment: Alignment.center,
                        child: const Text(
                            '1/1/2022'
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=> Get.toNamed(Routes.detail_track_record),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 40,
                          width: 55,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )
                          ),
                          alignment: Alignment.center,
                          child: const Icon(CupertinoIcons.search, color: Color(0xff5C94E8),),
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
                        fontFamily: 'ComicSans'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (index, context){
                      return Container(
                        margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
                        height: 75,
                        width: Get.width * 0.75,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.date_range,
                                        color: Color(0xff505050),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: const Text(
                                          'Onsite',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff505050)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text(
                                      '1/1/2022',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff505050)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        CupertinoIcons.clock,
                                        color: Color(0xff505050),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: const Text(
                                          'Time',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff505050)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text(
                                      '08.00 - 16.00',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff505050)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  CupertinoIcons.right_chevron,
                                  color: Color(0xff505050),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}