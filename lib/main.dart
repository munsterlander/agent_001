import 'package:agent_001/game/overlays/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pixel_border/pixel_border.dart';

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
        buttonTheme: ButtonThemeData(
          shape: PixelBorder.solid(
            pixelSize: 2.0,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(16.0),
            ),
            color: Colors.purple,
          ),
        ),
      ),
      home: Scaffold(
        body: GameWidget<Agent001Game>(
          game: Agent001Game(),
          overlayBuilderMap: {
            MainMenu.id: (_, gameRef) => MainMenu(gameRef: gameRef),
            //GameOver.id: (_, Agent001Game gameRef) => GameOver(gameRef),
            //Settings.id: (_, Agent001Game gameRef) => Settings(gameRef),
            //NextLevel.id: (_, Agent001Game gameRef) => NextLevel(gameRef),
          },
          initialActiveOverlays: const [MainMenu.id],
        ),
      ),
    );
  }
}
