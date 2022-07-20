


import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TextController extends GetxController {
  final textController = TextEditingController();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final mobileNumberTextController = TextEditingController();
  final countryCodeTextController = TextEditingController();

  RxString controllerText = ''.obs;
  RxString nameText = ''.obs;
  RxString emailText = ''.obs;
  RxString mobileNumberText = ''.obs;
  RxString countryCodeText = ''.obs;









  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      controllerText.value = textController.text;
    });
    nameTextController.addListener(() {
      nameText.value = nameTextController.text;
    });
    emailTextController.addListener(() {
      emailText.value = emailTextController.text;
    });
    mobileNumberTextController.addListener(() {
      mobileNumberText.value = mobileNumberTextController.text;
    });
    countryCodeTextController.addListener(() {
      countryCodeText.value = countryCodeTextController.text;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



}