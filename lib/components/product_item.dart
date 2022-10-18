// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:front_mobile/utils/function.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://miuzbekistan.com/uploads/1/wwX799yy9lKYHyLirLiPGlzBbpKkFse6.png',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
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
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          filterText(
                              "Симсиз  сичқонча Logitech M650 L Graphite", 35),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color.fromRGBO(251, 193, 0, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color.fromRGBO(251, 193, 0, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color.fromRGBO(251, 193, 0, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color.fromRGBO(251, 193, 0, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color.fromRGBO(251, 193, 0, 1),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: const Text(
                      "331 000 so'm",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w900),
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Color.fromRGBO(251, 193, 0, 1),
                borderRadius: BorderRadius.circular(7)),
            child: Text(
              'Savatchaga',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
