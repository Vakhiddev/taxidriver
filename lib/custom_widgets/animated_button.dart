import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';

class AnimatedTimerButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final int? animationDuration;
  const AnimatedTimerButton({
    Key? key,
    this.animationDuration,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  _AnimatedTimerButtonState createState() => _AnimatedTimerButtonState();
}

class _AnimatedTimerButtonState extends State<AnimatedTimerButton> {
  double _position = 0.0;
  bool isActive = true;
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(const Duration(seconds: 1), (timer) {

      if (_position > -screenWidth * 0.9053) {
        setState(() {
          _position -= screenWidth * 0.9053 / 7;
        });
      } else {
        setState(() {
          isActive = false;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? widget.onTap : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              height: 77,
              width: screenWidth * 0.9053,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFF282D35),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDuration ?? 850),
              curve: Curves.linear,
              left: _position,
              child: Container(
                height: 77,
                width: screenWidth * 0.9053,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD600),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
           widget.child,
            // Padding(
            //   padding: EdgeInsets.only(left: , top: 26),
            //   child: TextContainer(
            //     widget.title!,
            //     fontSize: 22,
            //     fontWeight: FontWeight.w800,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
