import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double gridSize = 22;

final pixelFont14 = TextPaint(
  style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 14.0),
);

final pixelFont24 = TextPaint(
  style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 24.0),
);

class SpriteIds {
  static const String playerStand = 'player_stand';
  static const String block = 'block';
  static const String blockLeft = 'block_left';
  static const String blockBottomLeft = 'block_bottom_left';
  static const String blockBottom = 'block_bottom';
  static const String blockBottomRight = 'block_bottom_right';
  static const String blockRight = 'block_right';
  static const String blockTopRight = 'block_top_right';
  static const String blockTop = 'block_top';
  static const String blockTopLeft = 'block_top_left';
  static const String blockEndRight = 'block_end_right';
  static const String blockEndLeft = 'block_end_left';
  static const String blockEndTop = 'block_end_top';
  static const String blockEndBottom = 'block_end_bottom';
  static const String blockTopBottom = 'block_top_bottom';
  static const String blockLeftRight = 'block_left_right';
  static const String door = 'door';
  static const String key = 'key';
  static const String dialog = 'dialog';
  static const String button = 'button';
  static const String toggleOff = 'off';
  static const String toggleOn = 'on';
}
