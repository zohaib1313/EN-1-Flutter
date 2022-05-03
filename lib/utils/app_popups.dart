import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_en_1/utils/styles.dart';
import 'package:get/get.dart';

import '../app_pages.dart';

class AppPopUps {
  static bool isDialogShowing = true;

  static showProgressDialog(
      {required BuildContext context, bool? barrierDismissal}) {
    isDialogShowing = true;
    showDialog(
        useRootNavigator: false,
        useSafeArea: false,
        barrierDismissible: barrierDismissal ?? false,
        context: context,
        builder: (context) => Center(
              child: Container(
                decoration: BoxDecoration(
                  //color: AppColors(..blackcardsBackground,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                  boxShadow: [
                    BoxShadow(
                      //  color: AppColors().shadowColor,
                      color: Colors.transparent,
                      spreadRadius: 5.r,
                      blurRadius: 5.r,
                      offset: const Offset(3, 5), // changes position of shadow
                    ),
                  ],
                ),
                height: 120.h,
                width: 120.h,
                //  child: Lottie.asset(AssetsNames().loader),
                child: const CircularProgressIndicator(),
              ),
            )).then((value) {
      isDialogShowing = false;
    });
  }

  static dismissDialog() {
    if (isDialogShowing) {
      navigatorKey.currentState!.pop();
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(myContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: AppColor.orangeColor,
      ),
    );
  }

  static Future<bool> showConfirmDialog({
    onSubmit,
    required String title,
    required String message,
  }) async {
    return await showDialog(
        context: myContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Confirm'),
                onPressed: () {
                  onSubmit();
                },
              ),
            ],
          );
        });
  }

  static Future<bool> showAlertDialog({
    onSubmit,
    required String message,
  }) async {
    return await showDialog(
        context: myContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Ok'),
                onPressed: onSubmit ??
                    () {
                      Navigator.pop(context, true);
                    },
              ),
            ],
          );
        });
  }

  static Future<void> displayTextInputDialog(
      {onSubmit,
      required String title,
      required String message,
      required String hint}) {
    TextEditingController controller = TextEditingController();
    return showDialog(
        context: myContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: hint),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  onSubmit(controller.text);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  static void showSnackvBar(
      {required String message, required BuildContext context}) {
    Get.snackbar("Alert", message,
        colorText: Theme.of(context).primaryColorLight,
        backgroundColor: Theme.of(context).errorColor);
  }
}
