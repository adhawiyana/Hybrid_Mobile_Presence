import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester_app/features/set_password/controller_setpassword.dart';

class PageSetpassword extends GetView<ControllerSetpassword>{
  const PageSetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5C94E8),
      body: Center(
        child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: Get.width * 0.9
            ),
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 10,
              child: Obx(() => Form(
                key: controller.formkeySetpass,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Set Password",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 30,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "Please input your new password",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: TextFormField(
                        obscureText: controller.showPass.value,
                        controller: controller.edtNewPass,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          suffixIcon: IconButton(
                              onPressed: ()=> controller.showPass.value == true
                                  ? controller.showPass.value = false
                                  : controller.showPass.value = true,
                              icon: const Icon(CupertinoIcons.eye_fill)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff5C94E8),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xff5C94E8),
                                  width: 1
                              )
                          ),
                        ),
                        validator: (value) {
                          value!.isEmpty || value.length < 8
                              ? Fluttertoast.showToast(msg: 'Current password still empty')
                              : null;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: TextFormField(
                        obscureText: controller.showConfirmPass.value,
                        controller: controller.edtConfirmPass,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                              onPressed: ()=> controller.showConfirmPass.value == true
                                  ? controller.showConfirmPass.value = false
                                  : controller.showConfirmPass.value = true,
                              icon: const Icon(CupertinoIcons.eye_fill)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff5C94E8),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xff5C94E8),
                                  width: 1
                              )
                          ),
                        ),
                        validator: (value) {
                          value!.isEmpty || value.length < 8
                              ? Fluttertoast.showToast(msg: 'New password still empty')
                              : null;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
                      child: ElevatedButton(
                          onPressed: ()=> controller.validator(),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(Get.width, 40),
                              backgroundColor: const Color(0xff6496E6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                          child: const Text('Save')
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}