import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/presentation/controller/language_controller.dart';
import 'package:todoapp/presentation/controller/theme_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    final languageController = context.read<LanguageController>();
    final themeController = context.watch<ThemeController>();

    return Scaffold(
      appBar: AppBar(title: Text(tr('settings.title'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
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
                    languageController.setLanguage(context, locale);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(tr('settings.theme')),
              trailing: DropdownButton<ThemeMode>(
                value: themeController.current,
                onChanged: (mode) {
                  if (mode != null) {
                    themeController.setTheme(mode);
                  }
                },
                items: ThemeMode.values.map((mode) {
                  return DropdownMenuItem(
                    value: mode,
                    child: Text(
                      tr('settings.theme_${mode.name}'), // ex: theme_light
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // need to inject context to my controller after flutter initial build
      context.read<LanguageController>().loadFromContext(context);
    });
  }
}