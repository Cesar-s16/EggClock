import 'package:egg_clock/colors.dart';
import 'package:egg_clock/personal_button.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class EggTimer extends StatefulWidget {
  final int minutes;

  EggTimer({super.key, required this.minutes});

  @override
  _EggTimerState createState() => _EggTimerState();
}

class _EggTimerState extends State<EggTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.minutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resetTimer() {
    setState(() {
      _remainingSeconds = widget.minutes * 60;
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egg Timer'),
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
          child: _remainingSeconds > 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Tu huevo estará listo en:',
                      style:
                          TextStyle(fontSize: 20, color: EggColors.textPrimary),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/eggClock_egg.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.none,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$minutes:${seconds.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 98, color: EggColors.textPrimary),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Tu huevo está listo!',
                      style:
                          TextStyle(fontSize: 24, color: EggColors.textPrimary),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/eggClock_eggFinal.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.none,
                    ),
                    const SizedBox(height: 10),
                    PButton(
                      onPressed: _resetTimer,
                      text: 'Reiniciar',
                      width: 120,
                      height: 60,
                    ),
                    const SizedBox(height: 10),
                    PButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      text: 'Cerrar',
                      width: 120,
                      height: 60,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
