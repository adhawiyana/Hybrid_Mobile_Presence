import 'package:get/get.dart';
import 'package:tester_app/features/absence_success/api_absencesuccess.dart';
import 'package:tester_app/features/absence_success/controller_absencesuccess.dart';

class BindingAbsenceSuccess implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerAbsenceSuccess>(
        () => ControllerAbsenceSuccess(api: ApiAbsenceSuccess()));
  }
}
