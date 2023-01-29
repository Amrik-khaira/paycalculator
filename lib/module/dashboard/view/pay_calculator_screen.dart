import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paycalculator/core/constants/app_constants.dart';
import '../controller/pay_calculator_controller.dart';

class PayCalculatorScreen extends StatefulWidget {
  const PayCalculatorScreen({super.key});

  @override
  State<PayCalculatorScreen> createState() => _PayCalculatorScreenState();
}

class _PayCalculatorScreenState extends State<PayCalculatorScreen> {
  PayCalculatorController controller = Get.put(PayCalculatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _calculatorForm(),
            const SizedBox(
              height: 20,
            ),
            _bottomPartView(),
          ],
        ),
      ),
    );
  }

  _calculatorForm() {
    return Expanded(
        child: Container(
      color: Colors.grey.shade400,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                color: Colors.white,
                child: TextField(
                  controller: controller.noOfHours.value,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                  decoration: const InputDecoration(
                      hintText: "Number of hours", border: InputBorder.none),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                color: Colors.white,
                child: TextField(
                  controller: controller.hoursRate.value,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                  decoration: const InputDecoration(
                      hintText: "Hourly rate", border: InputBorder.none),
                )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () => controller.calculator(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                      left: 45, right: 45, top: 10, bottom: 10),
                ),
                child: const Text(
                  "Caculate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                )),
            const SizedBox(
              height: 25,
            ),
            Obx(() {
              return Visibility(
                visible: controller.isCalculateDone.value,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 50, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Report",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "regular pay : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.regularPay.value.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              );
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "overtime pay : ",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.overtimePay.value.toString(),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              );
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "total pay : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.totalPay.value.toString(),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              );
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "tax : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.tax.value.toString(),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              );
                            }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    ));
  }

  _bottomPartView() {
    return Container(
      color: Colors.grey,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Amrik Singh",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          Text(
            "301296257",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          )
        ],
      ),
    );
  }
}
