import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  var _textname = "".obs;

  get getText{
    _textname.value;
  }
  set setText(String screenvalue) {
    _textname.value = screenvalue;
  }

}