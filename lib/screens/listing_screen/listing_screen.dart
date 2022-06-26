import 'package:crypto_search/controllers/search_screen_controller.dart';
import 'package:crypto_search/screens/listing_screen/widgets/listings_card.dart';
import 'package:crypto_search/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.cryptoData.value.data!.isEmpty
                  ? Text("No data")
                  : ListView.builder(
                      itemCount: controller.cryptoData.value.data!.length,
                      itemBuilder: (context, index) {
                        return ListingsCard(
                            title: controller
                                    .cryptoData.value.data!["BTC"]!.name ??
                                '',
                            price: controller.cryptoData.value.data!["BTC"]!
                                .quote!.usd!.price!
                                .truncateToDouble());
                      });
        }));
  }
}
