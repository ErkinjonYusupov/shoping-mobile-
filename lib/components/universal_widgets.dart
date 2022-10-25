
import 'package:flutter/material.dart';
Widget searchWidget() {
  return InkWell(
    onTap: () {
      print('to search products');
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(25),
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
    ),
  );
}