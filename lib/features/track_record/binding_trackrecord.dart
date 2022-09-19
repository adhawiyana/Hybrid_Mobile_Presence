import 'package:get/get.dart';
import 'package:tester_app/features/track_record/api_trackrecord.dart';
import 'package:tester_app/features/track_record/controller_trackrecord.dart';

class BindingTrackrecord implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerTrackrecord>(() => ControllerTrackrecord(api: ApiTrackrecord()));
  }
}