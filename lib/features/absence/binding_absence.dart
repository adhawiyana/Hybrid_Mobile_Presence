import 'package:get/get.dart';
import 'package:tester_app/features/absence/api_absence.dart';
import 'package:tester_app/features/absence/controller_absence.dart';

class BindingAbsence implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerAbsence>(() => ControllerAbsence(api: ApiAbsence()));
  }
}
