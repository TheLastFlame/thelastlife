import 'package:get/get.dart';

class SettingsContoller extends GetxController {
  Rx<double> volumeValue = 0.5.obs;
  Rxn<String> locale = Rxn<String>();
}
