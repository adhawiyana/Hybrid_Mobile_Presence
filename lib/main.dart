import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tester_app/pages/app_pages.dart';
import 'package:tester_app/pages/app_routes.dart';
import 'package:tester_app/shared/controller/controller_bind.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  String pageName = '';

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  updatePageRoute(value) {
    try {
      var name = value!.route!.settings.name.toString();
      log(name);
      setState(() {
        pageName = name;
      });
    } catch (_) {}
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: (context, child)=> GetMaterialApp(
          navigatorKey: Get.key,
          title: 'Tester',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            platform: TargetPlatform.android,
            brightness: Brightness.light,
          ),
          builder: (BuildContext context, Widget? child){
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
                  child: Stack(
                    children: [
                      child!,
                    ],
                  ),
                )
            );
          },
          getPages: AppPages.pages,
          initialBinding: ControllerBind(),
          initialRoute: Routes.INITIAL,
          locale: const Locale('id', 'ID'),
          routingCallback: (value){
            if(value!= null){
              updatePageRoute(value);
            }
          },
          defaultTransition: Transition.cupertino,
        )
    );
  }
}

