import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:thelastlife/controllers/audio/songs.dart';
import 'package:thelastlife/controllers/settings_controller.dart';
import 'sfx.dart';

class AudioController {
  static SettingsContoller settingsController = Get.find<SettingsContoller>();

  static RxString nowPlayng = "".obs;

  static const String sfxPath = "sfx";
  static const String musicPath = "music";

  static final AudioPlayer _sfxPlayer = AudioPlayer();

  static final AudioPlayer _musicPlayer = AudioPlayer();

  static Future<void> init() async {
    AudioController.playSong(songs.first);
    _musicPlayer.onPlayerComplete.listen((event) {
      playSong(songs[Random().nextInt(songs.length)]);
    });
    loadCache();
  }

  static Future<void> loadCache() async {
    await AudioCache.instance.loadAll(
        SfxType.values.expand(getSfxNames).map((path) => 'sfx/$path').toList());
  }

  static void playSfx(SfxType type) {
    String fileName = getSfxNames(type)[0];

    _sfxPlayer.play(AssetSource('$sfxPath/$fileName'),
        volume: settingsController.volumeValue());
  }

  static void playSong(Song song) {
    nowPlayng("${song.name} by ${song.artist}");
    _musicPlayer.play(AssetSource('$musicPath/${song.filename}'),
        volume: settingsController.volumeValue());
  }

  static void setVolume(double volume) async{
    await _musicPlayer.setVolume(volume); 
    await _sfxPlayer.setVolume(volume);
  }

}
