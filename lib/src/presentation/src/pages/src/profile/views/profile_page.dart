import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Profile",
        actions: [],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const ProfileHeaderUserInfo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  CustomContainer(
                    boxShadow: [],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    child: Column(
                      children: const [
                        ProfileUserItem(
                          iconContainerColor: Colors.blue,
                          icon: Icons.person,
                          title: 'Security Settings',
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    "Others",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  CustomContainer(
                    boxShadow: [],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    child: Column(
                      children: const [
                        ProfileUserItem(
                          iconContainerColor: Colors.indigo,
                          icon: Icons.support,
                          title: 'Support',
                        ),
                        ProfileUserItem(
                          iconContainerColor: Colors.indigo,
                          icon: Icons.bookmarks_rounded,
                          title: 'About JunkIt',
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CustomContainer(
                    // boxShadow: [],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    child: ProfileUserItem(
                      iconContainerColor: Colors.red,
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () async {
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          AuthenticationLogoutRequested(),
                        );

                        BlocProvider.of<AppBottomNavigationBarBloc>(context)
                            .add(
                          AppBottomNavigationBarChanged(
                            activePage: const HomePage(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              3.h.ph,
            ],
          ),
        ),
      ),
    );
  }
}
