import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thelastlife/controllers/audio/audio_contoller.dart';

import '../i18n/strings.g.dart';

class SettingsContoller extends GetxController {

  final box = GetStorage("settings");

  
  Rx<double> volumeValue = 0.5.obs;
  var locale = Rxn<String>();
  var theme = Rxn<ThemeMode>();

  @override
  void onInit(){

    box.writeIfNull("volumeValue" , 0.5);
   
    volumeValue( box.read("volumeValue"));
    locale( box.read("locale"));

    theme(box.read("theme") ?? ThemeMode.system);


    print("init locale $locale");
    print("init volume $volumeValue");
    print("init theme $theme");
  }

  void setLocale(String newLocale){
    locale(newLocale);
    box.write("locale", newLocale);
  }

  void setVolume(double newVolume){

    volumeValue(newVolume);
    box.write("volumeValue", newVolume);
    AudioController.setVolume(newVolume);
  }

  void setThemeMode(ThemeMode themeMode){
    theme(themeMode);
    box.write("theme", themeMode);
  }

}
