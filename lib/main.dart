import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:your_waste/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = '7u7vXFoC5ISliuVLLGfnsmOOEevigX9ZV7HF5gqM';
  const keyClientKey = 'UXbVMRwMOwapnmUT1BvTzZ7oU4skGtbQervAf8Ld';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  // use for internationalization checkout: https://pub.dev/packages/easy_localization
  await EasyLocalization.ensureInitialized();

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: true, // When enabled, prints logs to console
    // liveQueryUrl: keyLiveQueryUrl, // Required if using LiveQuery
    autoSendSessionId: true, // Required for authentication and ACL
    // securityContext: securityContext, // Again, required for some setups
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: const App(),
    )),
    storage: storage,
  );
}
