import 'package:egg_clock/colors.dart';
import 'package:flutter/material.dart';

class PButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  const PButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 100,
    this.height = 50,
  });

  @override
  _PButtonState createState() => _PButtonState();
}

class _PButtonState extends State<PButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() {
          _isHovered = true;
        }),
        onExit: (_) => setState(() {
          _isHovered = false;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: _isHovered ? widget.width * 1.1 : widget.width,
          height: _isHovered ? widget.height * 1.1 : widget.height,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/eggClock_BottonSkin.png'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: const TextStyle(color: EggColors.buttonText),
          ),
        ),
      ),
    );
  }
}
