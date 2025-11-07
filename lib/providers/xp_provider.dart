import 'package:flutter/material.dart';
import '../utils/galaxy_pink_theme.dart';

class XPProvider with ChangeNotifier {
  int _xp = 85;
  PaletteChoice _p = PaletteChoice.Pink;

  int get xp => _xp;
  int get level => (_xp ~/ 100) + 1;
  PaletteChoice get palette => _p;

  void addXP(int v) {
    _xp += v;
    notifyListeners();
  }

  void setPalette(PaletteChoice p) {
    _p = p;
    notifyListeners();
  }
}
