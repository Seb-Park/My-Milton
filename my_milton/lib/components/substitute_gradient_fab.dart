import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class SubstituteGradientFAB extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Gradient gradient;
  final Alignment alignment;

  SubstituteGradientFAB(
      {Key key,
      @required this.onPressed,
      this.child,
      this.gradient = blankGradient,
      this.alignment = Alignment.bottomRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(floatingActionButtonSpacing),
        child: FloatingActionButton(
          onPressed: () {
            onPressed();
          },
          child: Container(
            width: 60,
            height: 60,
            child: child,
            decoration:
                BoxDecoration(shape: BoxShape.circle, gradient: gradient),
          ),
        ),
      ),
    );
  }
}
