import 'package:flutter/material.dart';
import './game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = 'Null';
  Game game = Game();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
                title: const Text('Two Player',
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                value: isSwitched,
                onChanged: (bool newval) {
                  setState(() {
                    isSwitched = newval;
                    activePlayer = 'X';
                    gameOver = false;
                    turn = 0;
                    result = '';
                    Player.pLayerO = [];
                    Player.pLayerX = [];
                  });
                }),
            Text("It's - - $activePlayer - - turn".toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 32)),
            Expanded(
                child: GridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              children: List.generate(
                  9,
                  (index) => InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: gameOver ? null : () => _onTap(index),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).shadowColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: Center(
                            child: Text(
                                Player.pLayerX.contains(index)
                                    ? 'X'
                                    : Player.pLayerO.contains(index)
                                        ? 'O'
                                        : '',
                                style: TextStyle(
                                    color: Player.pLayerX.contains(index)
                                        ? const Color.fromARGB(
                                            255, 205, 54, 231)
                                        : const Color.fromARGB(
                                            255, 229, 184, 244),
                                    fontSize: 60)),
                          ),
                        ),
                      )),
            )),
            Text(result,
                style: const TextStyle(color: Colors.white, fontSize: 22)),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  activePlayer = 'X';
                  gameOver = false;
                  turn = 0;
                  result = '';
                  Player.pLayerO = [];
                  Player.pLayerX = [];
                });
              },
              icon: const Icon(Icons.replay_circle_filled_sharp),
              label: const Text('Repeat The Game'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).splashColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  _onTap(int index) async {
    if ((Player.pLayerX.isEmpty || !Player.pLayerX.contains(index)) &&
        (Player.pLayerO.isEmpty || !Player.pLayerO.contains(index))) {
      game.playGame(index, activePlayer);
      upDateState();
      if (!isSwitched && !gameOver) {
        await game.autoPlay(activePlayer);
        upDateState();
      }
    }
  }

  void upDateState() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerplayer = game.checkWinner();
      if (winnerplayer != '') {
        gameOver = true;
        result = '$winnerplayer is the winner';
        activePlayer = '';
      } else if (!gameOver && turn == 9) {
        result = 'Draw';
      }
    });
  }
}
