import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:your_waste/your_waste.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState) {
          return BlocBuilder<AppBottomNavigationBarBloc,
              AppBottomNavigationBarState>(
            builder: (context, state) {
              return BottomNavigationBar(
                elevation: 10.0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: primaryColor,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                selectedLabelStyle: const TextStyle(
                  fontSize: 10,
                ),
                backgroundColor: Colors.white,
                // currentIndex: 0,
                items: [
                  _bottomNavItem(
                    active: state.activePage is HomePage,
                    icon: Icons.home,
                    text: "Home",
                    onTap: () {
                      context.read<AppBottomNavigationBarBloc>().add(
                            AppBottomNavigationBarChanged(
                              activePage: const HomePage(),
                            ),
                          );
                    },
                  ),
                  _bottomNavItem(
                    active: state.activePage is LoginPage,
                    icon: Icons.bookmark,
                    text: "BookMarks",
                    onTap: () {
                      context.read<AppBottomNavigationBarBloc>().add(
                            AppBottomNavigationBarChanged(
                              activePage: const HomePage(),
                            ),
                          );
                    },
                  ),
                  _bottomNavItem(
                    active: state.activePage is LoginPage,
                    icon: Icons.person,
                    text: "Profile",
                    onTap: () {
                      context.read<AppBottomNavigationBarBloc>().add(
                            AppBottomNavigationBarChanged(
                              activePage: const HomePage(),
                            ),
                          );
                    },
                  ),
                  // if (authState.authenticated) ...[
                  //   _bottomNavItem(
                  //     active: state.activePage is OvulationPage,
                  //     icon: Icons.calendar_month,
                  //     text: "Ovulation Days",
                  //     onTap: () {
                  //       context.read<AppBottomNavigationBarBloc>().add(
                  //             AppBottomNavigationBarChanged(
                  //               activePage: OvulationPage(),
                  //             ),
                  //           );
                  //     },
                  //   ),
                  //   _bottomNavItem(
                  //     active: state.activePage is AppointmentPage,
                  //     icon: Icons.perm_contact_cal,
                  //     text: "Appointments",
                  //     onTap: () {
                  //       context.read<AppBottomNavigationBarBloc>().add(
                  //             AppBottomNavigationBarChanged(
                  //               activePage: AppointmentPage(),
                  //             ),
                  //           );
                  //     },
                  //   ),
                  // ],
                ],
              );
            },
          );
        },
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavItem({
  required IconData icon,
  required String text,
  required bool active,
  required void Function() onTap,
}) {
  return BottomNavigationBarItem(
    label: text,
    icon: GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(
            SizerUtil.deviceType == DeviceType.mobile ? 5.sp : 9.sp),
        decoration: BoxDecoration(
          color: active ? Color(0XFFEEECED) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: active ? Border.all(color: secondaryColor) : null,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: active ? primaryColor : Colors.grey,
              size: SizerUtil.deviceType == DeviceType.mobile ? 18.sp : 9.sp,
            ),
            active
                ? const SizedBox.shrink()
                : Text(
                    text,
                    style: TextStyle(
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
                            ? 7.sp
                            : 3.sp),
                  )
          ],
        ),
      ),
    ),
  );
}
