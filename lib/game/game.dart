import 'package:agent_001/game/routes/main_menu.dart';
import 'package:agent_001/utils/mouse_click_detector.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:mini_sprite/mini_sprite.dart';

import '../assets/assets.dart';
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
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
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

    router = RouterComponent(
      initialRoute: 'home',
      routes: {
        'home': Route(MainMenu.new),
        'gameplay': Route(Level.new),
      },
    );
    add(router);

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

  @override
  void onPanDown(DragDownInfo info) {
    propagateToChildren<MouseClickDetector>(
      (p0) => p0.onMouseClickDown(info),
    );
  }

  @override
  void onPanEnd(DragEndInfo info) {
    propagateToChildren<MouseClickDetector>(
      (p0) => p0.onMouseClickUp(info),
    );
  }

  @override
  void onPanCancel() {
    propagateToChildren<MouseClickDetector>(
      (p0) => p0.onMouseClickCancel(),
    );
  }
}
