import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/components/category_products.dart';


import 'package:front_mobile/components/universal_widgets.dart';
import 'package:front_mobile/connection/api.dart';
import 'package:front_mobile/controllers/home_con.dart';
import 'package:front_mobile/controllers/main_controller.dart';
import 'package:front_mobile/utils/function.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainController mainController = Get.put(MainController());
  HomePageController controller=Get.put(HomePageController());

  void initState() {
    super.initState();
    mainController.fetchSliders();
    mainController.fetchCategories();
  }

  Future<Null> refreshList() async {
    await APICacheManager().deleteCache('API_sliders');
    await APICacheManager().deleteCache('API_categories');
    await APICacheManager().deleteCache('API_parent_categories');
    mainController.fetchSliders();
    mainController.fetchCategories();
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: refreshList,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 110.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shop',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      Icons.shopify,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              background: Column(
                children: <Widget>[
                  searchWidget()
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              GetBuilder<MainController>(
                builder: ((mainController) {
                  return Column(
                    children: [
                      complicatedImage(mainController.sliders),
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
                      SizedBox(
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
                      SizedBox(
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
                      SizedBox(height: 30),
                      Center(
                        child: Column(
                          children: [
                            Text(
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
                      SizedBox(height: 30),
                    ],
                  );
                }),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}



complicatedImage(arr) {
  if (arr.length > 0) {
    return CarouselSlider.builder(
      itemCount: arr.length,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.easeInBack,
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIdx) {
        return Center(
            child: Image.network(
          Apis.http + Apis.baseUrl + '/' + arr[index],
          fit: BoxFit.cover,
          width: 1000,
          height: 200,
        ));
      },
    );
  } else {
    return Container();
  }
}

categoryItem(item) {
  return InkWell(
    onTap: () {
      Get.to(()=>ProductsView(title:item['title'], categoryId: item['id'].toString(),));
    },
    child: Container(
      width: 100,
      padding: EdgeInsets.all(5),
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
          SizedBox(
            height: 5,
          ),
          Text(
            filterText(item['title'], 15),
            style: TextStyle(fontSize: 10),
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
      margin: EdgeInsets.symmetric(horizontal: 15),
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
