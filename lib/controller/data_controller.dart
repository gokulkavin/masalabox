import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:masalabox/model/data.dart';

class DataController extends GetxController {
  var isLoading = false.obs;
  Data? data;
  var phone = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await get(
        Uri.parse("https://gokulkavin.github.io/masalabox_data/data.json"));
    if (response.statusCode == 200) {
      try {
        var result = jsonDecode(response.body);
        data = Data.fromJson(result);
        isLoading(true);
      } catch (e) {
        return;
      } finally {
        isLoading(false);
      }
    } else {
      Get.snackbar("Error Loading Data", "${response.statusCode}");
    }
  }
}
