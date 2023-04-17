import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester_app/features/login/controller_login.dart';

class PageLogin extends GetView<ControllerLogin>{
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6496E6),
      resizeToAvoidBottomInset: false,
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
                child: Form(
                  key: controller.formkeyLogin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Text(
                            "Log in",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: controller.edtUsername,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                            ),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Username',
                              contentPadding: const EdgeInsets.only(left: 50, top: 15),
                          ),
                          validator: (value){
                            if(value == ''){
                              return 'Username is cannot empty';
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                      Obx(() => Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: controller.edtPassword,
                          obscureText: controller.showPass.value,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Password',
                            contentPadding: const EdgeInsets.only(left: 50, top: 15),
                            suffixIcon: IconButton(
                                onPressed: ()=> controller.showPass.value == false
                                    ? controller.showPass.value = true
                                    : controller.showPass.value = false,
                                icon: const Icon(Icons.remove_red_eye)
                          ),
                        ),
                          validator: (value){
                            if(value!.isEmpty || value.length < 6){
                              return 'Password is cannot empty';
                            }else{
                              return null;
                            }
                          },
                      ))),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: ()=> controller.validator(),
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                // ignore: unnecessary_const
                                  borderRadius: BorderRadius.all(const Radius.circular(10))
                              ),
                              elevation: 0,
                              fixedSize: Size(Get.width, 40)
                          ),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        child: Text(
                          'Bila mengalami masalah login?\nSilahkan hubungi admin',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 12,
                              color: const Color(0xff6496E6),
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}