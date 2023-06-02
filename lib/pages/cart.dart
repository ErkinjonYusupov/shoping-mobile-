import 'package:flutter/material.dart';
import 'package:front_mobile/dio/controllers/post.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  PostController controller = Get.put(PostController());
  @override
  void initState() {
    super.initState();
    controller.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (controller) {
      return SingleChildScrollView(
          child: Column(
        children: List.generate(
            controller.posts.length,
            (index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.posts[index].title.toString(),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                controller.posts[index].body.toString(),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(width: 5,),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          iconSize: 20,
                          constraints:const BoxConstraints(),
                          padding:const EdgeInsets.all(1),
                        )
                      ],
                    ),
                  ),
                )),
      ));
    });
  }
}
