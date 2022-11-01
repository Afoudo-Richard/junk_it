import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserOperations extends StatelessWidget {
  const UserOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubItemTitle(
          title: "Operations",
        ),
        0.5.h.ph,
        MasonryGridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return UserOperationsItem(
              title: "My Trash",
              icon: Icons.delete,
            );
          },
        ),
      ],
    );
  }
}

class UserOperationsItem extends StatelessWidget {
  const UserOperationsItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        child: Column(
          children: [
            const Icon(Icons.access_alarms),
            2.h.ph,
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
