import 'package:flutter/cupertino.dart';

class PlayerData {
  ValueNotifier<double> health = ValueNotifier<double>(100);

  void reset() {
    health.value = 100;
  }
}
