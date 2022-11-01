import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:your_waste/your_waste.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const AppDrawer(),
      body:
          BlocBuilder<AppBottomNavigationBarBloc, AppBottomNavigationBarState>(
        builder: (context, state) {
          return state.activePage;
        },
      ),

      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
