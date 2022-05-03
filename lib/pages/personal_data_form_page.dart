import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_en_1/utils/AppUtils.dart';
import 'package:flutter_test_en_1/utils/app_popups.dart';
import 'package:flutter_test_en_1/utils/spaces.dart';
import 'package:flutter_test_en_1/utils/styles.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/personal_data_form_page.dart';
import '../utils/common_widgets.dart';

class PersonalDataFormPage extends GetView<PersonalDataFormPageController> {
  static const id = '/PersonalDataFormPage';

  const PersonalDataFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Eligibility Score",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SafeArea(
        child: GetX<PersonalDataFormPageController>(
          initState: (state) {},
          builder: (_) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSpace,
                      Text(
                        "Personal Information",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      vSpace,
                      vSpace,
                      vSpace,
                      MyTextField(
                        hintText: "First Name",
                        controller: controller.firstNameController,
                        fillColor: AppColor.alphaGrey,
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      vSpace,
                      vSpace,
                      MyTextField(
                        hintText: "Last Name",
                        controller: controller.lastNameController,
                        fillColor: AppColor.alphaGrey,
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      vSpace,
                      vSpace,
                      MyDropDown(
                        rightPadding: 100.w,
                        leftPadding: 100.w,
                        fillColor: AppColor.alphaGrey,
                        labelText: 'Occupation',
                        value: controller.occupations.entries.first.key,
                        hintText: 'Select',
                        items: controller.occupations.entries
                            .map((e) => e.key)
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return "Required";
                          }
                          return null;
                        },
                        onChange: (value) {
                          print(value);
                          controller.selectedOccupation.value =
                              controller.occupations[value]!;
                        },
                      ),
                      if (controller.selectedOccupation.value == 1)
                        Column(
                          children: [
                            vSpace,
                            MyTextField(
                              hintText: "Job Title",
                              controller: controller.jobTitleController,
                              fillColor: AppColor.alphaGrey,
                              validator: (value) {
                                if (controller.selectedOccupation.value == 1 &&
                                    (value ?? "").isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                            ),
                            vSpace,
                          ],
                        ),
                      vSpace,
                      MyTextField(
                        hintText: "Monthly Income",
                        keyboardType: TextInputType.number,
                        controller: controller.monthlyIncomeController,
                        fillColor: AppColor.alphaGrey,
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      vSpace,
                      vSpace,
                      Text(
                        "Last Invoice Picture",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      vSpace,
                      InkWell(
                        onTap: () {
                          AppUtils.showPicker(
                              context: context,
                              onComplete: (File? file) {
                                controller.inVoiceFile.value = file;
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).scaffoldBackgroundColor),
                          height: 200,
                          width: 200,
                          child: controller.inVoiceFile.value == null
                              ? const Icon(Icons.image)
                              : Image.file(controller.inVoiceFile.value!),
                        ),
                      ),
                      vSpace,
                      Button(
                        buttonText: "Submit",
                        textColor: AppColor.whiteColor,
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.inVoiceFile.value == null) {
                              AppPopUps.showSnackvBar(
                                  message: "Select Invoice Image",
                                  context: context);
                            } else {
                              controller.getEligibilityAndScore(context,
                                  onComplete: (scores) {
                                AppPopUps.showAlertDialog(
                                    message:
                                        "Your Loan Eligibility Score is ${scores.toString()}");
                              });
                            }
                          }
                        },
                      ),
                      vSpace,
                      vSpace,
                      vSpace,
                      vSpace,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
