import 'package:agent_001/assets/mini_levels.dart';
import 'package:agent_001/game/level/door.dart';
import 'package:agent_001/game/level/hud.dart';
import 'package:agent_001/utils/audio_manager.dart';
import 'package:agent_001/utils/level_data.dart';
import 'package:agent_001/utils/player_data.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mini_sprite/mini_sprite.dart';

import '../assets/assets.dart';
import '../utils/constants.dart';
import '../utils/move_movement_detector.dart';

class Agent001Game extends FlameGame
    with
        HasCollisionDetection,
        HasKeyboardHandlerComponents,
        MouseMovementDetector,
        PanDetector {
  @override
  Color backgroundColor() => const Color(0xFF000000);
  final playerData = PlayerData();

  final _spritesMap = <String, Sprite>{};
  final _levelDataList = const [
    LevelData(
      levelString: MiniLevel.level1,
      levelName: 'Level 1',
      width: 15,
      height: 10,
      gridSize: gridSize,
      initialState: DoorState.unlocked,
      levelIndex: 0,
    ),
    LevelData(
      levelString: MiniLevel.level2,
      levelName: 'Level 2',
      width: 24,
      height: 16,
      gridSize: gridSize,
      levelIndex: 1,
    ),
    LevelData(
      levelString: MiniLevel.level3,
      levelName: 'Level 3',
      width: 25,
      height: 15,
      gridSize: gridSize,
      levelIndex: 2,
    ),
    LevelData(
      levelString: MiniLevel.level4,
      levelName: 'Level 4',
      width: 35,
      height: 20,
      gridSize: gridSize,
      levelIndex: 3,
    ),
    LevelData(
      levelString: MiniLevel.level5,
      levelName: 'Level 5',
      width: 55,
      height: 35,
      gridSize: gridSize,
      levelIndex: 4,
    ),
  ];

  void initialization() async {
    await Future.delayed(const Duration(seconds: 13));
    FlutterNativeSplash.remove();
  }

  @override
  Future<void> onLoad() async {
    initialization();
    // Loads all the audio assets
    await AudioManager.init();
    AudioManager.playBgm('background_slow.wav');

    // ignore: deprecated_member_use
    camera.viewport = FixedResolutionViewport(Vector2(640, 360) / 1.5);
    _spritesMap.addAll(
      await MiniLibrary.fromDataString(blocks).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(door).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(key).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(nineTB).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(enemyTurret).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(enemy).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    _spritesMap.addAll(
      await MiniLibrary.fromDataString(heart).toSprites(
        pixelSize: 1,
        palette: [Colors.transparent, Colors.white],
      ),
    );

    add(Hud());
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
