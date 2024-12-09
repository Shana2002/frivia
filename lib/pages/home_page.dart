import 'package:flutter/material.dart';
import 'package:friviaa/pages/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentDifficultyLevel = 0;
  double? _deviceHeight, _deviceWidth;

  final List<String> _difficulityText = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  const Text(
                    "Frivia",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _difficulityText[_currentDifficultyLevel.toInt()],
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
              _difficulituSlider(),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext _context) {
                    return GamePage(difficulityLevel: _difficulityText[_currentDifficultyLevel.toInt()].toLowerCase(),);
                  }));
                },
                height: _deviceHeight! * 0.1,
                color: Colors.blueAccent,
                child: SizedBox(
                  width: _deviceWidth! * 0.80,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.start,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _difficulituSlider() {
    return Slider(
        label: "Difficulity",
        thumbColor: Colors.blueAccent,
        activeColor: Colors.blueAccent,
        min: 0,
        max: 2,
        divisions: 2,
        value: _currentDifficultyLevel,
        onChanged: (_value) {
          setState(() {
            _currentDifficultyLevel = _value;
          });
        });
  }
}
