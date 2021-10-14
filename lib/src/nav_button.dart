import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    required this.height,
    this.text,
  });
  final double height;
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final Text? text;

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: height,
            child: Transform.translate(
              offset: Offset(
                  0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
              child: Opacity(
                opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                // child: child,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      child,
                      if (text != null)
                        Text(
                          text?.data??'',
                          style: text?.style,
                        )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
