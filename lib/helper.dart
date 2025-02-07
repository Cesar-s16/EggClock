import 'package:egg_clock/colors.dart';
import 'package:flutter/material.dart';
import 'egg_timer.dart';

void navigateToTimer(BuildContext context, int seconds) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EggTimer(seconds: seconds),
    ),
  );
}

void showCustomTimeDialog(BuildContext context) async {
  int customMinutes = 0;
  int customSeconds = 0;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Custom Timer',
          style: TextStyle(color: EggColors.textPrimary),
          textAlign: TextAlign.center,
        ),
        backgroundColor: EggColors.menuBackground,
        content: SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Minutes',
                      style: TextStyle(color: EggColors.textPrimary),
                    ),
                    SpinnerSelector(
                      initialValue: customMinutes,
                      onChanged: (value) {
                        customMinutes = value;
                      },
                    ),
                  ],
                ),
              ),
              const Text(
                ':',
                style: TextStyle(
                  fontSize: 48,
                  color: EggColors.textPrimary,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Seconds',
                      style: TextStyle(color: EggColors.textPrimary),
                    ),
                    SpinnerSelector(
                      initialValue: customSeconds,
                      onChanged: (value) {
                        customSeconds = value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: EggColors.textPrimary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Start',
              style: TextStyle(color: EggColors.textPrimary),
            ),
            onPressed: () {
              int totalSeconds = (customMinutes * 60) + customSeconds;
              if (totalSeconds < 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menos de 10 segundos no está permitido'),
                  ),
                );
              } else {
                Navigator.of(context).pop();
                navigateToTimer(context, totalSeconds);
              }
            },
          ),
        ],
      );
    },
  );
}

class SpinnerSelector extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  const SpinnerSelector({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _SpinnerSelectorState createState() => _SpinnerSelectorState();
}

class _SpinnerSelectorState extends State<SpinnerSelector> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        onSelectedItemChanged: (number) {
          widget.onChanged(number % 60);
        },
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(initialItem: 3000),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Center(
              child: Text(
                (index % 60).toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontSize: 24,
                  color: EggColors.textPrimary,
                ),
              ),
            );
          },
          childCount: 6000, // Large number to allow infinite scrolling
        ),
      ),
    );
  }
}
