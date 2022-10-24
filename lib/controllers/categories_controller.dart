import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:front_mobile/connection/api.dart';
import 'package:front_mobile/connection/service.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  bool loading = true;
  List categories = [];
  fetchCategories() async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist('API_parent_categories');
    if (!isCacheExist) {
      var res = await AllMethods.GET(Apis.parentCategories);
      if (!res['error']) {
        categories = res['body'];
      }
      APICacheDBModel cacheDBModel = new APICacheDBModel(
          key: 'API_parent_categories', syncData: json.encode(categories));
      await APICacheManager().addCacheData(cacheDBModel);
      loading = false;
      print('categories-NETWORK');
      update();
    } else {
      var cacheData =
          await APICacheManager().getCacheData('API_parent_categories');
      categories = json.decode(cacheData.syncData);
      print('categories-CACHE');
      update();
    }
  }
}
