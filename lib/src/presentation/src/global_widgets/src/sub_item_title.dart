import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class SubItemTitle extends StatelessWidget {
  const SubItemTitle({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing != null
            ? Text(
                "Overview",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox.shrink(),
        0.5.h.ph,
      ],
    );
  }
}
