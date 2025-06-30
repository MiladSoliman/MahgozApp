

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIToast {

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      // or Toast.LENGTH_LONG
      gravity: ToastGravity.BOTTOM,
      // TOP, CENTER, or BOTTOM
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}