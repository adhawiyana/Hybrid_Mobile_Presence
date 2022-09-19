import 'package:get/get.dart';
import '../../api/api2.dart';
import '../../response/user.dart';

class ControllerGlobalUser extends GetxController{
  var user = User().obs;

  @override
  void onInit() async {
    super.onInit();
    await setUserData();
  }

  setUserData() async {
    var data = await Api2().getUser();
    if (data != null) {
      user.value = User.fromJson(data);
    }
  }
}