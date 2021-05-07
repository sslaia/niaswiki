import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:niaswiki/home_page.dart';
import 'package:niaswiki/wiki_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: NiasWiki(),
      supportedLocales: [
        Locale('en'),
        Locale('id'),
      ],
      fallbackLocale: Locale('en'),
      path: 'assets/translations'));
}

class NiasWiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WikiProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: HomePage(),
      ),
    );
  }
}
