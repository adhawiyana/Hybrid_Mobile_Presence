import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';

class PageDetailtrackrecord extends GetView<ControllerTrackrecord>{
  const PageDetailtrackrecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/circle_pattern.png',
            alignment: Alignment.bottomCenter,
            height: Get.height,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 60, left: 20),
                  child: Text(
                    'Daily Record',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue.shade500,
                        fontFamily: 'ComicSans'
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 5, left: 20),
                  child: const Text(
                    'Lupa sama kerjaan kemarin? Cek disini!',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff575757),
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffACACAC)
                          )
                      )
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.date_range, size: 50, color: Color(0xffADADAD)),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            '01/01/2022',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'ComicSans'),
                          ),
                          Text(
                            '08:00-16:00',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, fontFamily: 'ComicSans'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 5, 25, 10),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffACACAC)
                          )
                      )
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(CupertinoIcons.location_solid, size: 50, color: Color(0xffADADAD)),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Onsite',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'ComicSans'),
                          ),
                          Text(
                            '117.123456, -0.123456',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, fontFamily: 'ComicSans'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: const Text(
                    'Today Task',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'ComicSans'),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, fontFamily: 'ComicSans'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        primary: const Color(0xff5C94E8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        fixedSize: Size(Get.width * 0.8.w, 50),
                      ),
                      child: const Text(
                        'Edit Activity',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'ComicSans'
                        ),
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}