import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/components/category_products.dart';

import 'package:front_mobile/components/universal_widgets.dart';
import 'package:front_mobile/connection/api.dart';
import 'package:front_mobile/controllers/home_con.dart';
import 'package:front_mobile/controllers/main_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainController mainController = Get.put(MainController());
  HomePageController controller = Get.put(HomePageController());

  void initState() async{
    super.initState();
   await mainController.fetchSliders();
   await mainController.fetchCategories();
  }

  Future<Null> refreshList() async {
    await APICacheManager().deleteCache('API_sliders');
    await APICacheManager().deleteCache('API_categories');
    await APICacheManager().deleteCache('API_parent_categories');
    mainController.fetchSliders();
    mainController.fetchCategories();
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
          // toolbarHeight: 55,
          title: searchWidget(),
          leadingWidth: 0,
        ),
        body: RefreshIndicator(
            onRefresh: refreshList,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  mainController.sliders.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider.builder(
                      itemCount: mainController.sliders.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 7),
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  imageUrl: Apis.http +
                                      Apis.baseUrl +
                                      '/' +
                                      mainController.sliders[index],
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ):const SizedBox(),
                  SectionHeader(
                      title: "Kategoriyalar",
                      onTap: () {
                        controller.chooseCurrent(1);
                      },
                      textBtn: 'Barchasini ko\'rish'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            mainController.categories.length,
                            (index) => categoryItem(
                                mainController.categories[index]))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SectionHeader(
                      title: "Aksiyalar",
                      onTap: () {},
                      textBtn: 'Barchasini ko\'rish'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        product(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SectionHeader(
                      title: "Yangi mahsulotlar",
                      onTap: () {},
                      textBtn: 'Barchasini ko\'rish'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        product(),
                        product(),
                        product(),
                        product(),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 15,
                    alignment: WrapAlignment.center,
                    runSpacing: 15,
                    children: [
                      product(),
                      product(),
                      product(),
                      product(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Savollaringiz bormi? Qo'ng'iroq qiling",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "+998 (90) 366-60-88",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )));
  }
}



categoryItem(item) {
  return InkWell(
    onTap: () {
      Get.to(() => ProductsView(
            title: item['title'],
            categoryId: item['id'].toString(),
          ));
    },
    child: Container(
      width: 100,
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          item['image_url'] != null
              ? Image.network(
                  Apis.http + Apis.baseUrl + '/' + item['image_url'],
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80,
                )
              : Container(),
          const SizedBox(
            height: 5,
          ),
          Text(
            item['title'].toString(),
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    ),
  );
}

class SectionHeader extends StatelessWidget {
  SectionHeader(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.textBtn})
      : super(key: key);
  final String title;
  final String textBtn;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: onTap, child: Text(textBtn))
        ],
      ),
    );
  }
}
