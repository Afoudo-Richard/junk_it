import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Home",
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                AuthenticationLogoutRequested(),
              );

              BlocProvider.of<AuthenticationBloc>(context).add(
                AuthenticationHasWalkedThroughChanged(
                  hasWalkedThrough: false,
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: pagePadding,
          child: Column(
            children: [
              2.h.ph,
              WelcomeUser(),
              2.h.ph,
              UserOperations(),
              2.h.ph,
              ArticleSection(),
              4.h.ph,
            ],
          ),
        ),
      ),
    );
  }
}
