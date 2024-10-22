import 'package:flutter/material.dart';

class Highlight extends StatelessWidget {
  const Highlight(
      {super.key, required this.isHighlighted, required this.child});

  final bool isHighlighted;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isHighlighted
            ? Colors.lightBlueAccent[100]?.withOpacity(0.2)
            : Colors.transparent,
      ),
      child: child,
    );
  }
}
