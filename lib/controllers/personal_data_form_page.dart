import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test_en_1/app_pages.dart';
import 'package:flutter_test_en_1/utils/app_popups.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PersonalDataFormPageController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();
  Map<String, int> occupations = {"Employed": 1, "Un-Employed": 0};
  RxInt selectedOccupation = 1.obs;
  Rxn<File?> inVoiceFile = Rxn<File>();
  var formKey = GlobalKey<FormState>();

  ////   https://www.randomnumberapi.com/api/v1.0/random?min=1&max=10&count=1
  void getEligibilityAndScore(BuildContext context, {onComplete}) async {
    AppPopUps.showProgressDialog(context: myContext!);
    try {
      http.Response response = await http.get(Uri.parse(
          "https://www.randomnumberapi.com/api/v1.0/random?min=1&max=10&count=1"));

      AppPopUps.dismissDialog();
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        onComplete(result);
      } else {
        AppPopUps.showSnackvBar(
            message: "Something went wrong!", context: context);
      }
    } catch (e) {
      ///multiple exceptions can be handled here..
      AppPopUps.dismissDialog();
      AppPopUps.showSnackvBar(
          message: "Something went wrong.!", context: context);
    }
  }
}
