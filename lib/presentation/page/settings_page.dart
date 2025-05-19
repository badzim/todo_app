import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('settings.title'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(tr('settings.language')),
          trailing: DropdownButton<Locale>(
            value: context.locale,
            items: context.supportedLocales.map((locale) {
              return DropdownMenuItem(
                value: locale,
                child: Text(locale.languageCode.toUpperCase()),
              );
            }).toList(),
            onChanged: (locale) {
              if (locale != null) {
                context.setLocale(locale);
                setState(() {}); // ✅ force le rebuild immédiat
              }
            },
          ),
        ),
      ),
    );
  }
}