import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedBack {
  FeedBack._();
  static void showToast({required bool complete, required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: complete ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
