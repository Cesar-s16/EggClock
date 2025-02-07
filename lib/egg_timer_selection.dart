import 'package:egg_clock/colors.dart';
import 'package:egg_clock/helper.dart';
import 'package:egg_clock/personal_button.dart';
import 'package:flutter/material.dart';

class EggTimerSelection extends StatelessWidget {
  const EggTimerSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/eggClock_background.png'),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
              ),
              border: Border.all(
                color: EggColors.windowBorder,
                width: 10,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text('Select Egg Timer',
                    style: TextStyle(color: EggColors.textPrimary)),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          PButton(
                            onPressed: () => navigateToTimer(context, 3 * 60),
                            text: '3 Minutos',
                            width: 120,
                            height: 60,
                          ),
                          PButton(
                            onPressed: () => navigateToTimer(context, 5 * 60),
                            text: '5 Minutos',
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
                            onPressed: () => navigateToTimer(context, 10 * 60),
                            text: '10 Minutos',
                            width: 120,
                            height: 60,
                          ),
                          PButton(
                            onPressed: () => navigateToTimer(context, 15 * 60),
                            text: '15 Minutos',
                            width: 120,
                            height: 60,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PButton(
                        onPressed: () => showCustomTimeDialog(context),
                        text: 'Custom',
                        width: 120,
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
