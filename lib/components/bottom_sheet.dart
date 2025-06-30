import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MahgozBottomSheet {
  MahgozBottomSheet._privateConstructor();

  static final MahgozBottomSheet instance =
      MahgozBottomSheet._privateConstructor();

  void showBottomSheet({
    required BuildContext context,
    String? title,
    String? message,
    String? actionName,
    Function? action,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child:  SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  message ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(7, 45, 68, 1), // background color
                      foregroundColor: Colors.white // text/icon color
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close the sheet
                      if (action != null) {
                        action();
                      } else {
                        null;
                      }
                    },
                    child: Text(
                      actionName ??'OK',
                      style:
                          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
