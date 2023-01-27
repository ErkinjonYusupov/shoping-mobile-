import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/utils/function.dart';

Widget searchWidget() {
  return InkWell(
    onTap: () {
      print('to search products');
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 241, 241, 241)),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Mahsulotlar qidirish',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget product() {
  return Container(
    width: 150,
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(2),
    child: Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://images.uzum.uz/cddpe6j5a95unf13aj9g/original.jpg',
              imageBuilder: (context, imageProvider) => Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(
            //   'https://images.uzum.uz/cddpe6j5a95unf13aj9g/original.jpg',
            //   fit: BoxFit.cover,
            //   width: 150,
            //   height: 150,
            // ),
            Positioned(
                child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(2)),
              child: const Text(
                "Super aksiya",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ))
          ],
        ),
        Container(
          height: 105,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        filterText(
                            "Симсиз  сичқонча Logitech M650 L Graphite", 40),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
              const Expanded(
                  flex: 2,
                  child: const Text(
                    "331 000 so'm",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w900),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
