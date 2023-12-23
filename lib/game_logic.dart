// ignore_for_file: curly_braces_in_flow_control_structures
import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> pLayerX = [];
  static List<int> pLayerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X')
      Player.pLayerX.add(index);
    else
      Player.pLayerO.add(index);
  }

  String checkWinner() {
    String winner = 'X';
    if (Player.pLayerX.containsAll(0, 1, 2) ||
        Player.pLayerX.containsAll(3, 4, 5) ||
        Player.pLayerX.containsAll(6, 7, 8) ||
        Player.pLayerX.containsAll(0, 3, 6) ||
        Player.pLayerX.containsAll(1, 4, 7) ||
        Player.pLayerX.containsAll(2, 5, 8) ||
        Player.pLayerX.containsAll(0, 4, 8) ||
        Player.pLayerX.containsAll(2, 4, 6))
      winner = 'X';
    else if (Player.pLayerO.containsAll(0, 1, 2) ||
        Player.pLayerO.containsAll(3, 4, 5) ||
        Player.pLayerO.containsAll(6, 7, 8) ||
        Player.pLayerO.containsAll(0, 3, 6) ||
        Player.pLayerO.containsAll(1, 4, 7) ||
        Player.pLayerO.containsAll(2, 5, 8) ||
        Player.pLayerO.containsAll(0, 4, 8) ||
        Player.pLayerO.containsAll(2, 4, 6))
      winner = 'O';
    else {
      winner = '';
    }
    return winner;
  }

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];
    for (int i = 0; i <= 9; i++) {
      if (!(Player.pLayerX.contains(i) || Player.pLayerO.contains(i)))
        emptyCells.add(i);
    }
    if (Player.pLayerX.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.pLayerX.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.pLayerX.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.pLayerX.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.pLayerX.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.pLayerX.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.pLayerX.containsAll(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.pLayerX.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;
    else if (Player.pLayerX.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.pLayerX.containsAll(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (Player.pLayerX.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.pLayerX.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.pLayerX.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.pLayerX.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.pLayerX.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.pLayerX.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;
    else if (Player.pLayerX.containsAll(3, 6) && emptyCells.contains(0))
      index = 0;
    else if (Player.pLayerX.containsAll(4, 7) && emptyCells.contains(1))
      index = 1;
    else if (Player.pLayerX.containsAll(5, 8) && emptyCells.contains(2))
      index = 2;
    else if (Player.pLayerX.containsAll(2, 1) && emptyCells.contains(0))
      index = 0;
    else if (Player.pLayerX.containsAll(4, 5) && emptyCells.contains(3))
      index = 3;
    else if (Player.pLayerX.containsAll(7, 8) && emptyCells.contains(6))
      index = 6;
    else if (Player.pLayerO.containsAll(4, 5) && emptyCells.contains(3))
      index = 3;
    else {
      Random random = Random();
      int randomIndex = random.nextInt(emptyCells.length);
      index = emptyCells[randomIndex];
    }
    playGame(index, activePlayer);
  }
}
