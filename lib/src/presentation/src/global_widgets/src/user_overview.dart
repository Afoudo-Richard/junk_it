import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class UserOverview extends StatelessWidget {
  const UserOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubItemTitle(
          title: "Overviews",
        ),
        0.5.h.ph,
      ],
    );
  }
}
