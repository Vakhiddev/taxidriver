import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/theme/colors.dart';

class MainButton extends StatefulWidget {
  final String? icon;
  final String title;
  final VoidCallback onPressed;

  const MainButton({
    super.key,
     this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            alignment: Alignment.center,
            child: Container(
              height: 65,
              margin: EdgeInsets.only(bottom: widget.icon != null ? 14 : 10),
              padding: EdgeInsets.only(left: widget.icon != null ? 18 : 23,
                right: widget.icon != null ? 13 : 19,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).customColor.containerColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(widget.icon != null)
                    SvgPicture.asset(widget.icon!,color: Theme.of(context).customColor.secondTextColor,),
                  const SizedBox(width: 13),
                  TextContainer(
                    widget.title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: Theme.of(context).customColor.secondTextColor,
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/next.svg",color: Theme.of(context).customColor.secondTextColor,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }
}
