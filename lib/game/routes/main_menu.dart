import 'package:agent_001/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class MainMenu extends PositionComponent with HasGameRef<Agent001Game> {
  MainMenu({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) {
    positionType = PositionType.viewport;
  }

  @override
  Future<void>? onLoad() {
    add(
      ButtonComponent(
        button: TextBoxComponent(
          text: 'Play',
          boxConfig: TextBoxConfig(
            growingBox: true,
          ),
        ),
        position: gameRef.size / 2,
        anchor: Anchor.center,
        onReleased: () {
          gameRef.router.pushNamed('gameplay');
        },
      ),
    );
    return super.onLoad();
  }
}
