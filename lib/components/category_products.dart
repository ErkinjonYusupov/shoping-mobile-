import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_mobile/components/universal_widgets.dart';
import 'package:front_mobile/controllers/main_controller.dart';
import 'package:get/get.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key, required this.title, required this.categoryId})
      : super(key: key);
  final String title;
  final String categoryId;
  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  MainController mainController = Get.put(MainController());

  void initState() {
    super.initState();
    print(widget.categoryId);
    mainController.fetchCategoryProducts(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilterWidget(),
          Expanded(
            
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
           
               children: [
                  product(),
                  product(),
                  product(),
                  product(),
                  product(),
                  product(),
                  product(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.equalizer_rounded),
              SizedBox(
                width: 3,
              ),
              Text('Ommabopligi')
            ],
          ),
          Row(
            children: [
              Icon(Icons.filter_alt_outlined),
              SizedBox(
                width: 3,
              ),
              Text('Filter')
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.dashboard_outlined))
        ],
      ),
    );
  }
}
