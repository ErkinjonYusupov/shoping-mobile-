import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 180, 180, 180), width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        
        children: [
          Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                fit: BoxFit.cover,
                width: 175,
                height: 175,
              ),
              Positioned(
                  child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(2)),
                child: Text(
                  "Super aksiya",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ))
            ],
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Smartfon Samsung Galaxy A32 6GB 128G...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "999 000 so'm",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}