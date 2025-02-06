import 'package:egg_clock/colors.dart';
import 'package:egg_clock/personal_button.dart';
import 'package:flutter/material.dart';
import 'egg_timer.dart';

class EggTimerSelection extends StatelessWidget {
  EggTimerSelection({super.key});

  void _navigateToTimer(BuildContext context, int minutes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EggTimer(minutes: minutes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Egg Timer'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/eggClock_background.png'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),
          border: Border.all(
            color: EggColors.windowBorder,
            width: 5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PButton(
                    onPressed: () => _navigateToTimer(context, 3),
                    text: '3 Minutes',
                    width: 120,
                    height: 60,
                  ),
                  PButton(
                    onPressed: () => _navigateToTimer(context, 5),
                    text: '5 Minutes',
                    width: 120,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PButton(
                    onPressed: () => _navigateToTimer(context, 10),
                    text: '10 Minutes',
                    width: 120,
                    height: 60,
                  ),
                  PButton(
                    onPressed: () => _navigateToTimer(context, 15),
                    text: '15 Minutes',
                    width: 120,
                    height: 60,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
