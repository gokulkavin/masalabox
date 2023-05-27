import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masalabox/views/product_detail_page.dart';

import '../controller/data_controller.dart';

class HomePage extends StatefulWidget {
  final Function switchCallScreen;
  const HomePage({Key? key, required this.switchCallScreen}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // DataController dataController = Get.put(DataController());
  DataController dataController = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => dataController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : dataController.data == null
                ? const Center(
                    child: Text(
                    "Data Not Found",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ))
                : ListView.builder(
                    itemCount: dataController.data?.dishes.length,
                    itemBuilder: (context, index) {
                      final restaurant = dataController.data?.restaurants;

                      return GestureDetector(
                        onTap: () {
                          var cusinesData = (restaurant ?? []).where(
                              (element) =>
                                  element.cuisine ==
                                  dataController.data?.dishes[index].cuisine);
                          if (cusinesData.isNotEmpty) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                  restaurant: cusinesData.first),
                            ))
                                .then((value) {
                              if (value != null) {
                                dataController.phone(value);
                                // DefaultTabController.of(context).animateTo(1);
                                widget.switchCallScreen();
                              }
                            });
                          }
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${dataController.data?.dishes[index].name}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                // Text(
                                //   "${dataController.data?.restaurants[index].location.address}",
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: 16,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
