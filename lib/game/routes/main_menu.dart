import 'package:agent_001/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:google_fonts/google_fonts.dart';

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
          textRenderer: TextPaint(
            style: GoogleFonts.pressStart2p(),
          ),
          text: 'Play',
          boxConfig: TextBoxConfig(
            growingBox: true,
          ),
          pixelRatio: 100,
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
