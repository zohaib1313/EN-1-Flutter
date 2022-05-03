import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_en_1/controllers/application_form_page_controller.dart';
import 'package:flutter_test_en_1/utils/spaces.dart';
import 'package:flutter_test_en_1/utils/styles.dart';
import 'package:flutter_test_en_1/utils/theme_service.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../utils/common_widgets.dart';
import 'personal_data_form_page.dart';

class ApplicationFormPage extends GetView<ApplicationFormPageController> {
  static const id = '/ApplicationFormPage';

  const ApplicationFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: GetX<ApplicationFormPageController>(
          initState: (state) {},
          builder: (_) {
            return Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      vSpace,
                      vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ThemeService().theme != ThemeMode.dark
                                ? "Day"
                                : "Night",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          CupertinoSwitch(
                            value: ThemeService().theme == ThemeMode.dark,
                            onChanged: (value) {
                              ThemeService().switchTheme();
                            },
                          )
                        ],
                      ),
                      vSpace,
                      vSpace,
                      vSpace,
                      vSpace,
                      Text(
                        "Please Fill Information Below",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      vSpace,
                      vSpace,
                      vSpace,
                      Text(
                        "Desired Loan:",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      vSpace,
                      Center(
                        child: Text(
                          "${controller.amountSlider.value} €",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      vSpace,
                      SfSlider(
                        min: 100.0,
                        max: 1000.0,
                        value: controller.amountSlider.value,
                        interval: 50.0,
                        stepSize: 50,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          controller.amountSlider.value = value;
                          controller.calculateRate();
                        },
                      ),
                      vSpace,
                      vSpace,
                      MyDropDown(
                        fillColor: AppColor.alphaGrey,
                        labelText: 'Time Period',
                        value: controller.months.entries.first.key,
                        hintText: 'Select',
                        items: controller.months.entries
                            .map((e) => e.key)
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return "Required";
                          }
                          return null;
                        },
                        onChange: (value) {
                          controller.selectedTimePeriodKey.value = value;
                          controller.calculateRate();
                        },
                      ),
                      vSpace,
                      vSpace,
                      vSpace,
                      Text(
                        "Total amount will be paid:",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      vSpace,
                      Center(
                        child: Text(
                          "${controller.totalAmountTobePaid.value} €",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 28,
                                  color: Theme.of(context).primaryColorDark),
                        ),
                      ),
                      vSpace,
                      vSpace,
                      Button(
                        buttonText: "Agree and Proceed",
                        textColor: AppColor.whiteColor,
                        onTap: () {
                          Get.toNamed(PersonalDataFormPage.id);
                        },
                      ),
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
