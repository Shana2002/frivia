import 'package:flutter/material.dart';
import 'package:friviaa/providers/game_page_provide.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final String difficulityLevel;
  GamePage({required this.difficulityLevel});

  double? _deviceWidth, _deviceHeight;

  GamePageProvide? _pageProvider;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_conetext) => GamePageProvide(context: context,difficultyLevel: difficulityLevel),
      child: _buildUi(),
    );
  }

  Widget _buildUi() {
    return Builder(builder: (_context) {
      _pageProvider = _context.watch<GamePageProvide>();
      if (_pageProvider!.quections != null) {
        return Scaffold(
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceHeight! * 0.05),
            child: _gameUI(),
          )),
        );
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      }
    });
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _quectionText(),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: _deviceHeight! * 0.02,
            ),
            _falseButton(),
          ],
        ),
      ],
    );
  }

  Widget _quectionText() {
    return Text(
      _pageProvider!.getCurrentQuectionText(),
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {
        _pageProvider?.awnserQuection("True");
      },
      color: Colors.green,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "True",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      onPressed: () {
        _pageProvider?.awnserQuection("False");
      },
      color: Colors.red,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "False",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
