import 'package:flutter/material.dart';
import 'package:demineur/model/CaseModel.dart';
import 'package:demineur/model/MapModel.dart';

class GameViewModel extends ChangeNotifier {
  static const double size = 40;
  final MapModel _mapModel = MapModel();

  int get nbLine => _mapModel.nbLine;
  int get nbCol => _mapModel.nbCol;
  int get nbBomb => _mapModel.nbBomb;

  CaseModel? getCase(int x, int y) => _mapModel.getCase(x, y);
  bool isHiddenAt(int x, int y) => _mapModel.isHiddenAt(x, y);
  bool hasFlagAt(int x, int y) => _mapModel.hasFlagAt(x, y);
  bool hasExplodedAt(int x, int y) => _mapModel.hasExplodedAt(x, y);
  int numberAround(int x, int y) => _mapModel.numberAround(x, y);

  void generateMap(int lines, int cols, int bombs) {
    _mapModel.nbLine = lines;
    _mapModel.nbCol = cols;
    _mapModel.nbBomb = bombs;
    _mapModel.generateMap();
    notifyListeners();
  }

  void click(int x, int y) {
    if (!hasFlagAt(x, y)) {
      _mapModel.reveal(x, y);
      if (hasExplodedAt(x, y)) {
        _mapModel.revealAll();
      }
      notifyListeners();
    }
  }

  void onLongPress(int x, int y) {
    _mapModel.toggleFlag(x, y);
    notifyListeners();
  }

  Widget getIcon(int x, int y) {
    final caseModel = getCase(x, y);
    if (caseModel == null) return SizedBox();

    if (caseModel.hasFlag) {
      return Image.asset('assets/images/flag.png', height: size);
    }
    if (caseModel.hidden) {
      return Image.asset('assets/images/hidden.png', height: size);
    }
    if (caseModel.hasExplosed) {
      return Image.asset('assets/images/exploded.png', height: size);
    }
    if (caseModel.hasBomb) {
      return Image.asset('assets/images/bomb.png', height: size);
    }

    switch (caseModel.number) {
      case 0:
        return Image.asset('assets/images/0.png', height: size);
      case 1:
        return Image.asset('assets/images/1.png', height: size);
      case 2:
        return Image.asset('assets/images/2.png', height: size);
      case 3:
        return Image.asset('assets/images/3.png', height: size);
      case 4:
        return Image.asset('assets/images/4.png', height: size);
      case 5:
        return Image.asset('assets/images/5.png', height: size);
      case 6:
        return Image.asset('assets/images/6.png', height: size);
      case 7:
        return Image.asset('assets/images/7.png', height: size);
      case 8:
        return Image.asset('assets/images/8.png', height: size);
      default:
        return SizedBox();
    }
  }
}
