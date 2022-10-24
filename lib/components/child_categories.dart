import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_mobile/utils/function.dart';

class ChildCategories extends StatefulWidget {
  const ChildCategories({Key? key, required this.children,required this.title}) : super(key: key);
  final List children;
  final String title;
  @override
  State<ChildCategories> createState() => _ChildCategoriesState();
}

class _ChildCategoriesState extends State<ChildCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: SingleChildScrollView(child: Column(
        children: List.generate(widget.children.length, 
          (index) => category(widget.children[index])
      )
      ))
    );
  }
}