import 'dart:convert';
import 'dart:io';
import 'package:crypto_search/screens/search_screen/models/crypto_model.dart';
import 'package:crypto_search/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchScreenController extends GetxController {
  var cryptoData = CryptoModel().obs;
  var isLoading = false.obs;
  var datumList = <Datum>[].obs;
  var namesList = <String>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> fetchCryptoDataList(String names) async {
    namesList.clear();

    namesList.value = names.split(',');
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(Constant.cryptoUrl + names),
          headers: {
            "X-CMC_PRO_API_KEY": "27ab17d1-215f-49e5-9ca4-afd48810c149"
          });

      var data = jsonDecode(response.body);

      cryptoData.value = CryptoModel.fromJson(data);
    } on SocketException {
      Get.snackbar('Error', 'Check your internet connection');
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
