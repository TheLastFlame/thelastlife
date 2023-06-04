import 'package:audioplayers/audioplayers.dart';
import 'sfx.dart';

class AudioController {
  static const String sfxPath = "sfx";

  static final AudioPlayer _sfxPlayer = AudioPlayer();

  static Future<void> loadCache() async {
    // This assumes there is only a limited number of sound effects in the game.
    // If there are hundreds of long sound effect files, it's better
    // to be more selective when preloading.
    await AudioCache.instance
        .loadAll(SfxType.values.expand(getSfxNames).map((path) => 'sfx/$path').toList());
  }

  static void playSfx(SfxType type) {
    String fileName = getSfxNames(type)[0];

    _sfxPlayer.play(AssetSource('$sfxPath/$fileName'), volume: 1);
  }
}
