import 'package:get/get.dart';
import 'package:tester_app/features/home/api_home.dart';
import 'package:tester_app/features/home/controller_home.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
  }
}