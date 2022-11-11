import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        junkItApi: RepositoryProvider.of<JunkItApi>(context),
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      ),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("User Logged in Successfully"),
                ),
              );
          } else if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Failed to login user'),
                ),
              );
          }
        },
        child: Scaffold(
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
                  20.h.ph,
                  CustomContainer(
                    backgroundColor: Colors.transparent,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                            "Log in",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          3.h.ph,
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return CustomInput(
                                label: "Email",
                                inputHintText: "Enter your email address",
                                backgroundColor: Colors.white.withOpacity(0.7),
                                labelTextStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                onChanged: (email) =>
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(LoginEmailChanged(email)),
                                inputErrorText: state.email.invalid
                                    ? state.email.error
                                    : null,
                              );
                            },
                          ),
                          2.h.ph,
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return CustomInput(
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
                                onChanged: (value) =>
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(LoginPasswordChanged(value)),
                                inputErrorText: state.password.invalid
                                    ? state.password.error
                                    : null,
                              );
                            },
                          ),
                          3.h.ph,
                          SizedBox(
                            width: 100.w,
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return CustomButton(
                                  onPressed: () {
                                    state.status.isValidated
                                        ? context
                                            .read<LoginBloc>()
                                            .add(LoginSubmitted())
                                        : BlocProvider.of<LoginBloc>(context)
                                            .add(SubmitLoginInputsChecked());
                                  },
                                  child: state.status.isSubmissionInProgress
                                      ? const LoadingIndicator(
                                          color: secondaryColor,
                                        )
                                      : Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                          2.h.ph,
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              backgroundColor: Colors.white,
                              border: const BorderSide(color: primaryColor),
                              child: Text(
                                "Sign in anonymously",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(
                                  AuthenticationSignInAnonymous(),
                                );
                              },
                            ),
                          ),
                          5.h.ph,
                          ListRowText(
                            leadingText: "Don't have an account?",
                            trailingText: " " + "Sign Up",
                            onTapTrailingText: () {
                              Navigator.pushReplacement(
                                context,
                                RegistrationPage.route(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
