import 'package:flutter/material.dart';
import 'package:flutter_test_en_1/pages/application_form_page.dart';
import 'package:flutter_test_en_1/pages/personal_data_form_page.dart';
import 'package:get/get.dart';

import 'controllers/application_form_page_controller.dart';
import 'controllers/personal_data_form_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext? myContext = navigatorKey.currentState!.context;

appPages() {
  return [
    GetPage(
        name: ApplicationFormPage.id,
        page: () => const ApplicationFormPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ApplicationFormPageController>(
            () => ApplicationFormPageController(),
          );
        })),
    GetPage(
        name: PersonalDataFormPage.id,
        page: () => const PersonalDataFormPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PersonalDataFormPageController>(
            () => PersonalDataFormPageController(),
          );
        })),
  ];
}
