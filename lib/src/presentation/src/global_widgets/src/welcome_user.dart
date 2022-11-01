import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
              0.5.h.ph,
              Text(
                "Richard Afoudo",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
          width: 20.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(4.sp),
              border: Border.all(
                color: secondaryColor,
              ),
            ),
            child: Image.asset(
              'JunkIt_logo'.toPng,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
