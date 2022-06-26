import 'package:crypto_search/screens/listing_screen/listing_screen.dart';
import 'package:crypto_search/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/search_screen_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text('CoinRich', style: Styles.appBarTitleTS),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  style: Styles.appBarTitleTS,
                  controller: searchController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Coin Symbol',
                      labelStyle: Styles.appBarTitleTS),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await _searchScreenController
                  .fetchCryptoDataList(searchController.text);

              Get.to(() => ListingScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade600,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        child: const Text(
                          'SEARCH',
                          style: Styles.searchTitleTS,
                        ))),
              ),
            ),
          )
        ]));
  }
}
