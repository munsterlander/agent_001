import 'package:flutter/cupertino.dart';

class PlayerData {
  int curretLevel = 0;
  ValueNotifier<double> health = ValueNotifier<double>(100);

  void reset() {
    health.value = 100;
  }
}
