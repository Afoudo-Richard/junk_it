import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RegistrationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.clamp,
            colors: [
              secondaryColor,
              primaryColor,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/others/wm_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              8.h.ph,
              CustomContainer(
                backgroundColor: Colors.transparent,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/others/logo.png",
                            width: 30.w,
                          ),
                        ],
                      ),
                      3.h.ph,
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      3.h.ph,
                      CustomInput(
                        label: "FirstName",
                        inputHintText: "Enter your firstname",
                        backgroundColor: Colors.white.withOpacity(0.7),
                        labelTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      2.h.ph,
                      CustomInput(
                        label: "LastName",
                        inputHintText: "Enter your lastname",
                        backgroundColor: Colors.white.withOpacity(0.7),
                        labelTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      2.h.ph,
                      CustomInput(
                        label: "Email",
                        inputHintText: "Enter your email address",
                        backgroundColor: Colors.white.withOpacity(0.7),
                        labelTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      2.h.ph,
                      CustomInput(
                        label: "Password",
                        inputObscureText: true,
                        inputHintText: "Enter Account Password",
                        backgroundColor: Colors.white.withOpacity(0.7),
                        labelTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        trailing: Icon(
                          Icons.remove_red_eye,
                          size: 18.sp,
                        ),
                      ),
                      2.h.ph,
                      CustomInput(
                        label: "Confirm Password",
                        inputObscureText: true,
                        inputHintText: "Confirm your password",
                        backgroundColor: Colors.white.withOpacity(0.7),
                        labelTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        trailing: Icon(
                          Icons.remove_red_eye,
                          size: 18.sp,
                        ),
                      ),
                      2.h.ph,
                      SizedBox(
                        width: 100.w,
                        child: CustomButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      5.h.ph,
                      ListRowText(
                        leadingText: "Already have an account?",
                        trailingText: " " + "Sign In",
                        onTapTrailingText: () {
                          Navigator.pushReplacement(
                            context,
                            LoginPage.route(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              3.h.ph,
            ],
          ),
        ),
      ),
    ));
  }
}
