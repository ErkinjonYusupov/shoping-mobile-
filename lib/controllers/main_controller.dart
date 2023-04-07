import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:front_mobile/connection/api.dart';
import 'package:front_mobile/connection/service.dart';

import 'package:get/get.dart';

class MainController extends GetxController {
  bool loading = true;
  List sliders = [];
  List categories = [];
  List categoryProducts = [];
   fetchSliders() async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist('API_sliders');
    if (!isCacheExist) {
      var res = await AllMethods.GET(Apis.sliders);
      if (!res['error']) {
        sliders = res['body'];
      }
      APICacheDBModel cacheDBModel = new APICacheDBModel(
          key: 'API_sliders', syncData: json.encode(sliders));
      await APICacheManager().addCacheData(cacheDBModel);
      loading = false;
      print('slider-NETWORK');

      update();
    } else {
      var cacheData = await APICacheManager().getCacheData('API_sliders');
      sliders = json.decode(cacheData.syncData);
      print('slider-CACHE');

      update();
    }
  }

   fetchCategories() async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist('API_categories');
    if (!isCacheExist) {
      var res = await AllMethods.GET(Apis.categories);
      if (!res['error']) {
        categories = res['body']['data'];
      }
      APICacheDBModel cacheDBModel = new APICacheDBModel(
          key: 'API_categories', syncData: json.encode(categories));
      await APICacheManager().addCacheData(cacheDBModel);
      loading = false;
      print('categories-NETWORK');
      update();
    } else {
      var cacheData = await APICacheManager().getCacheData('API_categories');
      categories = json.decode(cacheData.syncData);
      print('categories-CACHE');
      update();
    }
  }

   fetchCategoryProducts(id) async {
    var res = await AllMethods.GET(Apis.categoryProducts,
        params: {'category_id': id});
    if (!res['error']) {
      categoryProducts = res['body']['data'];
    }
    loading = false;
    update();
  }
}
