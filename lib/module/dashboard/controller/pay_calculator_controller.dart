import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/utils/common_methods.dart';

class PayCalculatorController extends GetxController {
  var noOfHours = TextEditingController().obs;
  var hoursRate = TextEditingController().obs;
  RxDouble regularPay = RxDouble(0.0);
  RxDouble overtimePay = RxDouble(0.0);
  RxDouble totalPay = RxDouble(0.0);
  RxDouble tax = RxDouble(0.0);
  RxBool isCalculateDone = false.obs;

  bool validateInputes() {
    if (noOfHours.value.text.trim().isEmpty) {
      CommonMethods.showErrorMessagePopUp("Please enter number of hours");
      return false;
    } else if (hoursRate.value.text.trim().isEmpty) {
      CommonMethods.showErrorMessagePopUp("Please enter hourly rate");
      return false;
    } else {
      return true;
    }
  }

  calculator() {
    if (validateInputes()) {
      isCalculateDone.value = false;
      if (double.parse(noOfHours.value.text) <= 40) {
        totalPay.value = double.parse(noOfHours.value.text) *
            double.parse(hoursRate.value.text);
        regularPay.value = totalPay.value;
      } else {
        totalPay.value = (double.parse(noOfHours.value.text) - 40) *
                double.parse(hoursRate.value.text) *
                1.5 +
            40 * double.parse(hoursRate.value.text);
      }
      overtimePay.value = totalPay.value - regularPay.value;
      tax.value = totalPay.value * 0.18;
      isCalculateDone.value = true;
    }
  }
}
