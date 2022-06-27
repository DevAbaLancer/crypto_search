import 'package:crypto_search/controllers/search_screen_controller.dart';
import 'package:crypto_search/screens/listing_screen/widgets/listings_card.dart';
import 'package:crypto_search/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListingScreen extends StatelessWidget {
  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());
  ListingScreen({Key? key}) : super(key: key);
  // TabController tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CoinRich', style: Styles.appBarTitleTS),
          centerTitle: true,
          elevation: 0,
        ),
        body: GetX<SearchScreenController>(builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.pie_chart),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Show Chart"),
                    Flexible(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            "Count: ${controller.cryptoData.value.data?.length ?? 0}"),
                      ],
                    ))
                  ],
                ),
              ),
              Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.cryptoData.value.status?.errorCode == 0
                        ? controller.cryptoData.value.data!.isNotEmpty
                            ? ListView.builder(
                                itemCount:
                                    controller.cryptoData.value.data?.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  return ListingsCard(
                                      onTap: () {
                                        Get.bottomSheet(
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                            ),
                                            height: 300,
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      controller
                                                              .cryptoData
                                                              .value
                                                              .data![controller
                                                                  .namesList[
                                                                      index]
                                                                  .toUpperCase()]!
                                                              .name ??
                                                          '',
                                                      style:
                                                          Styles.searchTitleTS,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      'Tags',
                                                      style:
                                                          Styles.searchTitleTS,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: controller
                                                          .cryptoData
                                                          .value
                                                          .data![controller
                                                              .namesList[index]
                                                              .toUpperCase()]!
                                                          .tags!
                                                          .length,
                                                      itemBuilder:
                                                          (context, index2) {
                                                        return Container(
                                                          color: Colors.grey,
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          margin:
                                                              EdgeInsets.all(8),
                                                          child: Text(controller
                                                              .cryptoData
                                                              .value
                                                              .data![controller
                                                                  .namesList[
                                                                      index]
                                                                  .toUpperCase()]!
                                                              .tags![index2]),
                                                        );
                                                      }),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      'Price Last Updated',
                                                      style:
                                                          Styles.searchTitleTS,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      DateFormat().format(
                                                          controller
                                                              .cryptoData
                                                              .value
                                                              .data![controller
                                                                  .namesList[
                                                                      index]
                                                                  .toUpperCase()]!
                                                              .quote!
                                                              .usd!
                                                              .lastUpdated!),
                                                      style:
                                                          Styles.searchTitleTS,
                                                    )
                                                  ],
                                                ),
                                                //DateFormat('yyyy-MM-dd').format(day)
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      title: controller
                                              .cryptoData
                                              .value
                                              .data![controller.namesList[index]
                                                  .toUpperCase()]!
                                              .name ??
                                          '',
                                      price: controller
                                          .cryptoData
                                          .value
                                          .data![controller.namesList[index]
                                              .toUpperCase()]!
                                          .quote!
                                          .usd!
                                          .price!
                                          .truncateToDouble());
                                })
                            : Center(
                                child: Text(
                                  "No Data",
                                  style: Styles.listCardTitleTS
                                      .copyWith(color: Colors.black),
                                ),
                              )
                        : Center(
                            child: Text(
                            "No Data",
                            style: Styles.listCardTitleTS
                                .copyWith(color: Colors.black),
                          )),
              ),
            ],
          );
        }));
  }
}
