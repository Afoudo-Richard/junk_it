import 'package:flutter/material.dart';
import 'package:your_waste/src/utils/utils.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.radius = 15,
    this.color = primaryColor,
  }) : super(key: key);

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: radius,
        height: radius,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
