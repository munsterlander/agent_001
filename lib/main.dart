import 'package:agent_001/game/overlays/instructions.dart';
import 'package:agent_001/game/overlays/main_menu.dart';
import 'package:agent_001/game/overlays/credits.dart';
import 'package:agent_001/game/overlays/game_over.dart';
import 'package:agent_001/game/overlays/game_won.dart';
import 'package:agent_001/game/overlays/settings_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'game/game.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['PressStartP2'], license);
  });

  runApp(const Agent001GameApp());
}

class Agent001GameApp extends StatelessWidget {
  const Agent001GameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agent 001',
      theme: ThemeData(
        fontFamily: 'PressStartP2',
      ),
      home: Scaffold(
        body: GameWidget<Agent001Game>(
          game: Agent001Game(),
          overlayBuilderMap: {
            MainMenu.id: (_, gameRef) => MainMenu(gameRef: gameRef),
            Instructions.id: (_, gameRef) => Instructions(gameRef: gameRef),
            GameOver.id: (_, Agent001Game gameRef) =>
                GameOver(gameRef: gameRef),
            GameWon.id: (_, Agent001Game gameRef) =>
                GameWon(gameRef: gameRef),
            SettingsMenu.id: (_, Agent001Game gameRef) =>
                SettingsMenu(gameRef: gameRef),
            Credits.id: (_, Agent001Game gameRef) => Credits(gameRef: gameRef),
          },
          initialActiveOverlays: const [MainMenu.id],
        ),
      ),
    );
  }
}
