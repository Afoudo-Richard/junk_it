import 'package:flutter/material.dart';
import 'package:your_waste/src/utils/utils.dart';

AppBar appBar(
    {required String title,
    List<Widget>? actions,
    bool automaticallyImplyLeading = true}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading,
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        color: primaryColor,
      ),
    ),
    centerTitle: true,
    actions: actions,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    // leading: InkWell(
    //   child: Icon(
    //     Icons.chevron_left,
    //     color: Colors.black,
    //     size: 30.sp,
    //   ),
    //   // onTap: () => Navigator.pop(context),
    // ),
  );
}
