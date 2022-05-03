import 'package:get/get.dart';

class ApplicationFormPageController extends GetxController {
  Map<String, int> months = {
    "1 Month": 1,
    "3 Months": 3,
    "6 Months": 6,
    "1 Year": 12
  };

  var temp = false.obs;
  RxDouble amountSlider = 100.0.obs;

  Rx<String> selectedTimePeriodKey = ''.obs;

  RxDouble totalAmountTobePaid = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedTimePeriodKey.value = months.keys.first;
    calculateRate();
  }

  calculateRate() {
    double totalAmount = amountSlider.value;
    int totalMonths = months[selectedTimePeriodKey.value] ?? 1;
    double onePercentOfAmount = (1.0 / 100.0) * totalAmount;
    double calculatedPercentOverMonth = onePercentOfAmount * totalMonths;
    double monthlyRate =
        (totalAmount / totalMonths) + calculatedPercentOverMonth;
    totalAmountTobePaid.value = monthlyRate.toPrecision(2);
  }
}
