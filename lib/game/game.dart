import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../utils/move_movement_detector.dart';
import 'level/level.dart';

class Agent001 extends FlameGame
    with HasKeyboardHandlerComponents, MouseMovementDetector, TapDetector {
  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(Vector2(640, 360)/2);
    add(Level());
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    propagateToChildren<MouseMovementDetectorAwareComponent>(
      (p0) => p0.onMouseMove(info),
    );
  }
}
