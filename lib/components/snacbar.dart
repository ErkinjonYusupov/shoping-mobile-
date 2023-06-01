import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackbar(String message, {bool isError = true, String title="Errors"}) {

  Get.snackbar(
      title,
      message,
      titleText: Text(title, style: const TextStyle(color: Colors.white),),
      messageText: Text(message, style:const TextStyle(
          color: Colors.white
      ),),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError?Colors.redAccent:Colors.green
  );

}