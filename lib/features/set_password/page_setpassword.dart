import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tester_app/features/set_password/controller_setpassword.dart';

class PageSetpassword extends GetView<ControllerSetpassword>{
  const PageSetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff5C94E8),
        title: const Text(
          'Password Change',
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'ComicSans'
          ),
        ),
      ),
      backgroundColor: const Color(0xff5C94E8),
      body: SingleChildScrollView(
        child: Form(
            key: controller.formkeySetpass,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'Lupa sama sandi mu? Yuk amankan akun mu!',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'ComicSans'
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
              ),
              child: Column(
                children: <Widget>[
              Container(
              margin: const EdgeInsets.only(top: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  height: 80,
                  width: 80,
                  imageUrl: 'http://192.168.1.21:4500/uploads/${controller.controllerGlobalUser.user.value.picture}',
                  progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                          color: Colors.white
                      )
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle
                    ),
                    child: const Icon(CupertinoIcons.person, color: Colors.white, size: 60),
                  ),
                ),
              ),
            ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      controller.controllerGlobalUser.user.value.idUser.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ComicSans'
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      controller.controllerGlobalUser.user.value.name ?? 'Username',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'ComicSans'
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          label: const Text('Current Password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty || value.length < 6){
                          return 'Please input the password';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          label: const Text('New Password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty || value.length < 6){
                          return 'Please input the password';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: ()=> controller.validator(),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: const Color(0xff5C94E8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          fixedSize: Size(Get.width * 0.8.w, 40),
                        ),
                        child: const Text(
                          'Set Password',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ComicSans'
                          ),
                        )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      'Ingin akun aman? Mari ubah sandi anda!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'ComicSans'
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        ),
      ),
    );
  }
}