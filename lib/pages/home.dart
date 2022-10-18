import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:front_mobile/components/product_item.dart';
import 'package:front_mobile/utils/function.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SearchWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ComplicatedImageDemo(),
                SectionHeader(
                    title: "Kategoriyalar",
                    onTap: () {},
                    textBtn: 'Barchasini ko\'rish'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryItem(),
                      CategoryItem(),
                      CategoryItem(),
                      CategoryItem(),
                      CategoryItem(),
                      CategoryItem(),
                      CategoryItem()
                    ],
                  ),
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
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
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
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                    ],
                  ),
                ),
                // Wrap(
                //   spacing: 15,
                //   alignment: WrapAlignment.center,
                //   runSpacing: 15,
                //   children: [
                //     ProductItem(),
                //     ProductItem(),
                //     ProductItem(),
                //     ProductItem(),
                //   ],
                // ),
                SizedBox(height:30),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Savollaringiz bormi? Qo'ng'iroq qiling",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("+998 (90) 366-60-88", style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                SizedBox(height:30),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imgList[2], fit: BoxFit.cover, width: 80.0),
          SizedBox(
            height: 5,
          ),
          Text(
            filterText("Sut mahsulotlari", 15),
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
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

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              const Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 6),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: imageSliders,
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
            const Text(
              'Mahsulotlar qidirish',
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
