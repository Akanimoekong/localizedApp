import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../universal/locale_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Localization Example"),
        actions: [
          DropdownButton<Locale>(
            value: localeProvider.locale,
            items:
                LocaleProvider.supportedLocales.map((Locale locale) {
                  return DropdownMenuItem<Locale>(
                    value: locale,
                    child: Text(locale.toString()),
                  );
                }).toList(),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                localeProvider.setLocale(newLocale);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.helloWorld,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 32),
              Text(
                AppLocalizations.of(context)!.message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
