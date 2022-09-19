import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/login/controller_login.dart';

class PageLogin extends GetView<ControllerLogin>{
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: Get.height,
            child: Image.asset(
              'assets/images/background_login.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: controller.formkeyLogin,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 70),
                    child: const Text(
                      'Mobile Presence',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'ComicSans'
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ComicSans'
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.only(top: 15, left: 35, right: 35),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    color: const Color(0xffF4F4F4),
                    elevation: 4,
                    child: TextFormField(
                      controller: controller.edtUsername,
                      decoration: const InputDecoration(
                        // border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username',
                          contentPadding: EdgeInsets.only(left: 50, top: 15),
                          border: InputBorder.none
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
                  Obx(() => Card(
                    margin: const EdgeInsets.only(top: 15, left: 35, right: 35),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    color: const Color(0xffF4F4F4),
                    elevation: 4,
                    child: TextFormField(
                      controller: controller.edtPassword,
                      obscureText: controller.showPass.value,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 50, top: 15),
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      validator: (value){
                        if(value!.isEmpty || value.length < 6){
                          return 'Password is cannot empty';
                        }else{
                          return null;
                        }
                      },
                    ),
                  )),
                  GestureDetector(
                    onTap: ()=> controller.showPass.value == false
                        ? controller.showPass.value = true
                        : controller.showPass.value = false,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 15, left: 50),
                      child: Text(
                        'Show password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue.shade400
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: ()=> controller.validator(),
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            // ignore: unnecessary_const
                              borderRadius: BorderRadius.all(const Radius.circular(10))
                          ),
                          elevation: 0,
                          fixedSize: const Size(120, 40)
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontFamily: 'ComicSans',
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Having trouble sign in?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue.shade400
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}