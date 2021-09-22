import 'dart:ui';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class AppConfig {
  final Color _colorText = HexColor('#393a3a');
  final Color _backColor = HexColor('#F7F7F7');
  final Color _colorMain = HexColor('#30a84c');

  Color get colorText => _colorText;
  Color get backColor => _backColor;
  Color get colorMain => _colorMain;

}

AppConfig appConfig = AppConfig();
