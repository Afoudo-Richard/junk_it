import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        2.h.ph,
        // MasonryGridView.count(
        //   padding: EdgeInsets.only(
        //     bottom: 6.h,
        //   ),
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   crossAxisCount: 3,
        //   mainAxisSpacing: 8,
        //   crossAxisSpacing: 8,
        //   itemCount: 3,
        //   itemBuilder: (BuildContext context, int index) {
        //     return UserOperationsItem(
        //       title: "My Trash",
        //       icon: Icons.delete,
        //     );
        //   },
        // ),
        GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            UserOperationsItem(
              title: "View Location",
              icon: Icons.map,
              color: Colors.pink,
              onTap: () {
                Navigator.push(context, MapLocationPage.route());
              },
            ),
            UserOperationsItem(
              title: "Schedule",
              icon: Icons.more_time,
              color: Colors.amber,
              onTap: () {
                Navigator.push(context, MapLocationPage.route());
              },
            ),
            UserOperationsItem(
              title: "Measure",
              icon: Icons.drive_file_rename_outline_rounded,
              color: Colors.brown,
              onTap: () {
                Navigator.push(context, MapLocationPage.route());
              },
            ),
            UserOperationsItem(
              title: "My Trash",
              icon: Icons.delete,
              color: Colors.teal,
            ),
            UserOperationsItem(
              title: "My Trash",
              icon: Icons.delete,
              color: Colors.red,
            ),
          ],
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
    required this.color,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        // margin: EdgeInsets.symmetric(
        //   horizontal: 1.h,
        //   vertical: 1.h,
        // ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 25.sp,
            ),
            2.h.ph,
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
