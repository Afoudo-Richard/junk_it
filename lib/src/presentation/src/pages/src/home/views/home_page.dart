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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: pagePadding,
          child: Column(
            children: [
              WelcomeUser(),
              UserOperations(),
              ArticleItem(),
            ],
          ),
        ),
      ),
    );
  }
}
