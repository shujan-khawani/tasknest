import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final giveValue;
  const MyProgressIndicator({super.key, required this.giveValue});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(22.0),
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 500),
          tween: Tween(begin: 0.0, end: giveValue),
          builder: (context, value, child) {
            return LinearProgressIndicator(
              value: value,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.green.shade700,
              ),
              minHeight: 5,
              borderRadius: BorderRadius.circular(5),
            );
          },
        ));
  }
}
