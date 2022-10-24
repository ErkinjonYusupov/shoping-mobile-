
import 'package:flutter/material.dart';
import 'package:front_mobile/components/child_categories.dart';
import 'package:get/get.dart';
filterText(String val, int length){
  if(val.length>length){
    return val.substring(0, length)+"...";
  }
  else{
    return val;
  }
}
category(item){
  return InkWell(
    onTap: () {
      if(item['children'].length>0){
        Get.to(()=>ChildCategories(children:item['children'], title:item['title']));
      }else{
        print('productlar section');
      }
    },
    child: Row(
        children: [
          Expanded(
            child: Image.network(
              'https://miuzbekistan.com/uploads/1/wwX799yy9lKYHyLirLiPGlzBbpKkFse6.png',
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
          Expanded(
            flex: 3,
            child: 
          Text(
            item['title'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ),
          Expanded(child: 
          item['children'].length>0?Icon(Icons.chevron_right_outlined, color: Colors.grey.shade400,size: 35,):Container())
        ],
      ),
  );
}
