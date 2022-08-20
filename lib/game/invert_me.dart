import 'package:flame/game.dart';
import 'package:invert_me/game/level/level.dart';

class InvertMe extends FlameGame {
  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(Vector2(640, 360));
    add(Level());
  }
}
