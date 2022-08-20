import 'package:flame/components.dart';
import 'package:flame/events.dart';

mixin MouseClickDetector on Component {
  bool onMouseClickDown(DragDownInfo info) {
    return true;
  }

  bool onMouseClickUp(DragEndInfo info) {
    return true;
  }

  bool onMouseClickCancel() {
    return true;
  }
}
