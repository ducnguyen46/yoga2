import 'package:flutter/material.dart';
import 'package:yoga/constants/app_color.dart';

class SwitchButton extends StatefulWidget {
  final bool enable;
  final ValueChanged<bool> onChanged;

  const SwitchButton({
    Key? key,
    required this.enable,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  Duration _duration = Duration(milliseconds: 200);
  late AnimationController _animationController;
  late Animation _switchAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _switchAnimation = AlignmentTween(
      begin: (widget.enable ? Alignment.centerRight : Alignment.centerLeft),
      end: (widget.enable ? Alignment.centerLeft : Alignment.centerRight),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }

              widget.enable == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Container(
              height: 30,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _switchAnimation.value == Alignment.centerRight
                    ? AppColor.purpleDecor.withOpacity(0.7)
                    : AppColor.darkGray.withOpacity(0.5),
              ),
              child: Container(
                alignment: _switchAnimation.value == Alignment.centerRight
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                margin: EdgeInsets.all(6),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
