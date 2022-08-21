import 'package:agent_001/game/level/door.dart';
import 'package:agent_001/utils/audio_manager.dart';
import 'package:agent_001/utils/level_data.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mini_sprite/mini_sprite.dart';

import '../assets/assets.dart';
import '../utils/constants.dart';
import '../utils/move_movement_detector.dart';
import 'level/level.dart';

class Agent001Game extends FlameGame
    with
        HasCollisionDetection,
        HasKeyboardHandlerComponents,
        MouseMovementDetector,
        PanDetector,
        HasTappables {
  final _spritesMap = <String, Sprite>{};
  final _levelDataList = const [
    LevelData(
      levelString: level1Map,
      levelName: 'Level 1',
      width: 15,
      height: 10,
      gridSize: gridSize,
      initialState: DoorState.unlocked,
      levelIndex: 0,
    ),
    LevelData(
      levelString: level2Map,
      levelName: 'Level 2',
      width: 24,
      height: 16,
      gridSize: gridSize,
      levelIndex: 1,
    ),
    LevelData(
      levelString: level3Map,
      levelName: 'Level 3',
      width: 25,
      height: 15,
      gridSize: gridSize,
      levelIndex: 2,
    ),
  ];

  late final RouterComponent router;

  void initialization() async {
    await Future.delayed(const Duration(seconds: 13));
    FlutterNativeSplash.remove();
  }

  @override
  Future<void> onLoad() async {
    initialization();
    // Loads all the audio assets
    await AudioManager.init();
    //AudioManager.playBgm('bgm.wav');

    camera.viewport = FixedResolutionViewport(Vector2(640, 360) / 2);
    _spritesMap.addAll(
      await MiniLibrary.fromDataString(blocks).toSprites(
        color: Colors.white,
        pixelSize: 1,
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(door).toSprites(
        color: Colors.white,
        pixelSize: 1,
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(key).toSprites(
        color: Colors.white,
        pixelSize: 1,
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(nineTB).toSprites(
        color: Colors.white,
        pixelSize: 1,
      ),
    );

    //add(Level());
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    propagateToChildren<MouseMovementDetectorAwareComponent>(
      (p0) => p0.onMouseMove(info),
    );
  }

  Sprite? getSprite(String spriteId) {
    return _spritesMap[spriteId];
  }

  LevelData? getLevelData(int levelId) {
    if (_levelDataList.length > levelId) {
      return _levelDataList.elementAt(levelId);
    }
    return null;
  }
}
