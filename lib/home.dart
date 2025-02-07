import 'package:egg_clock/colors.dart';
import 'package:egg_clock/personal_button.dart';
import 'package:flutter/material.dart';
import 'egg_timer_selection.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToEggTimerSelection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EggTimerSelection(),
      ),
    );
  }

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
                title: const Text('Home Page',
                    style: TextStyle(color: EggColors.textPrimary)),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Vamos a cocinar huevos',
                        style: TextStyle(
                            fontSize: 24, color: EggColors.textPrimary),
                      ),
                      const SizedBox(height: 20),
                      PButton(
                        onPressed: () => _navigateToEggTimerSelection(context),
                        text: 'Iniciar',
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
