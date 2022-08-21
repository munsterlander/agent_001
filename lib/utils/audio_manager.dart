import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

// This class is responsible for playing all the sound effects
// and background music in this game.
class AudioManager {
  static final sfx = ValueNotifier(true);
  static final bgm = ValueNotifier(true);

  static Future<void> init() async {
    FlameAudio.bgm.initialize();
    final files = [
      'player_shoot.wav',
      'enemy_shoot.wav',
      'turret_shoot.wav',
/*       'bgm.wav',
      'boss_bgm.wav', */
      'player_step.wav',
      'door.wav',
    ];
    await FlameAudio.audioCache.loadAll(files);
    await warmUp(files);
  }

  static Future<void> warmUp(List<String> files) async {
    for (final file in files) {
      await FlameAudio.play(file, volume: 0);
    }
  }

  static void playSfx(String file) {
    if (sfx.value) {
      FlameAudio.play(file);
    }
  }

  static void playBgm(String file) {
    if (bgm.value) {
      FlameAudio.bgm.play(file);
    }
  }

  static void pauseBgm() {
    FlameAudio.bgm.pause();
  }

  static void resumeBgm() {
    if (bgm.value) {
      FlameAudio.bgm.resume();
    }
  }

  static void stopBgm() {
    FlameAudio.bgm.stop();
  }
}
