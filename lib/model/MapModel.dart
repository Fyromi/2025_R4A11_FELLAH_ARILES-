import 'dart:math';
import 'package:demineur/model/CaseModel.dart';

class MapModel {
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases() {
    _cases = List<List<CaseModel>>.generate(
        nbLine, (i) => List<CaseModel>.generate(nbCol, (j) => CaseModel()));
  }

  void initBomb() {
    int nbBombset = 0;

    while (nbBombset < nbBomb) {
      int x = Random().nextInt(nbLine);
      int y = Random().nextInt(nbCol);

      if (!_cases[y][x].hasBomb) {
        _cases[y][x].hasBomb = true;
        nbBombset++;
      }
    }
  }

  void initNumbers() {
    for (var y = 0; y < nbLine; y++) {
      for (var x = 0; x < nbCol; x++) {
        final currentCase = _cases[y][x];
        if (!currentCase.hasBomb) {
          currentCase.number = computeNumber(x, y);
        }
      }
    }
  }

  int computeNumber(int x, int y) {
    const directions = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ];

    return directions.where((d) {
      final adjacentCase = tryGetCase(x + d[0], y + d[1]);
      return adjacentCase?.hasBomb ?? false;
    }).length;
  }

  CaseModel? tryGetCase(int x, int y) =>
      (x >= 0 && x < nbCol && y >= 0 && y < nbLine) ? _cases[y][x] : null;

  void generateMap() {
    initCases();
    initBomb();
    initNumbers();
  }

  void reveal(int x, int y) {
    if (_cases[y][x].hidden && !_cases[y][x].hasFlag) {
      _cases[y][x].hidden = false;

      if (_cases[y][x].hasBomb) {
        explode(x, y);
      } else if (_cases[y][x].number == 0) {
        revealAdjacent(x, y);
      }
    }
  }

  void revealAll() {
    for (int y = 0; y < nbLine; y++) {
      for (int x = 0; x < nbCol; x++) {
        _cases[y][x].hidden = false;
      }
    }
  }

  void explode(int x, int y) {
    _cases[y][x].hasExplosed = true;
    revealAll();
  }

  void toggleFlag(int x, int y) {
    if (_cases[y][x].hidden) {
      _cases[y][x].hasFlag = !_cases[y][x].hasFlag;
    }
  }

  void revealAdjacent(int x, int y) {
    const directions = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ];

    for (var dir in directions) {
      final nvX = x + dir[0];
      final nvY = y + dir[1];

      if (nvX >= 0 && nvX < nbCol && nvY >= 0 && nvY < nbLine) {
        final neighbor = _cases[nvY][nvX];
        if (neighbor.hidden && !neighbor.hasBomb) {
          reveal(nvX, nvY);
        }
      }
    }
  }

  CaseModel? getCase(int x, int y) =>
      (x >= 0 && x < nbCol && y >= 0 && y < nbLine) ? _cases[y][x] : null;

  bool hasBombAt(int x, int y) => getCase(x, y)?.hasBomb ?? false;

  int numberAround(int x, int y) => getCase(x, y)?.number ?? 0;

  bool isHiddenAt(int x, int y) => getCase(x, y)?.hidden ?? false;

  bool hasFlagAt(int x, int y) => getCase(x, y)?.hasFlag ?? false;

  bool hasExplodedAt(int x, int y) => getCase(x, y)?.hasExplosed ?? false;
}