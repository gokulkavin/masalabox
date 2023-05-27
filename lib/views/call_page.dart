import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masalabox/controller/data_controller.dart';

class CallPage extends StatelessWidget {
  CallPage({Key? key}) : super(key: key);
  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Center(
            child: Text(
          dataController.phone.value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )),
      ),
    );
  }
}
