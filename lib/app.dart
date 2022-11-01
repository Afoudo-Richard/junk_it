import 'package:easy_localization/easy_localization.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import "package:flutter/material.dart";
import 'package:your_waste/your_waste.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => YourWasteApi(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(create: (context) => AppBottomNavigationBarBloc()),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ConnectivityAppWrapper(
          app: MaterialApp(
            // locale: state.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            theme: appTheme(context),
            builder: (context, child) {
              return InternetConnectivityWidgetWrapper(
                child: GlobalScaffold(
                  child: BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          if (state.authenticated ||
                              state.isSignedInAnonymous) {
                            _navigator.pushAndRemoveUntil<void>(
                              MainScreen.route(),
                              (route) => false,
                            );
                          } else {
                            if (state.hasWalkedThrough) {
                              _navigator.pushAndRemoveUntil<void>(
                                LoginPage.route(),
                                (route) => false,
                              );
                            } else {
                              _navigator.pushAndRemoveUntil<void>(
                                WalkThroughPage.route(),
                                (route) => false,
                              );
                            }
                          }
                        },
                      );
                    },
                    child: child,
                  ),
                ),
              );
            },
            onGenerateRoute: (_) {
              final state = context.read<AuthenticationBloc>().state;
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationChecker(check: !(state.checker)));
              return SplashPage.route();
            },
          ),
        );
      },
    );
  }
}
