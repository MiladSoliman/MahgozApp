
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToastUtils {
   void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
