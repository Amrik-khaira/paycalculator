import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMethods{
  static showErrorMessagePopUp(String message){
    Get.snackbar(
  "Error",
  message,
  colorText: Colors.white,
  backgroundColor: Colors.lightBlue,
 
);
  }
}