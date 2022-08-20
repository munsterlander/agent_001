import 'package:flame/components.dart';

class FollowCam extends PositionComponent {
  final double deadZoneRadius;
  final PositionComponent target;
  final double smoothingSpeed;

  FollowCam({
    required this.target,
    required this.deadZoneRadius,
    this.smoothingSpeed = 20.0,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) {
    position = target.position;
  }

  @override
  void update(double dt) {
    final dir = (target.absolutePosition - absolutePosition);
    final len = dir.length;
    if (len > deadZoneRadius) {
      position += dir.normalized() * (len - deadZoneRadius);
    }
    super.update(dt);
  }
}
