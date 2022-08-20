import 'package:flame/components.dart';
import 'package:flame/events.dart';

mixin MouseMovementDetectorAwareComponent on Component {
  bool onMouseMove(PointerHoverInfo info) {
    return true;
  }
}
