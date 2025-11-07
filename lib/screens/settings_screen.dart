import 'package:flutter/material.dart';
import 'package:my_learning_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../providers/xp_provider.dart';
import '../utils/galaxy_pink_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    final xp = Provider.of<XPProvider>(context);
    final lp = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(t("Settings"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t("Appearance"),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // chọn palette
            Container(
              decoration: GalaxyPinkTheme.glassDecoration(),
              child: ListTile(
                title: Text(t("Theme Palette")),
                trailing: DropdownButton<PaletteChoice>(
                  value: xp.palette,
                  dropdownColor: GalaxyPinkTheme.spaceBase,
                  items: const [
                    DropdownMenuItem(
                      value: PaletteChoice.Pink,
                      child: Text("Galaxy Pink"),
                    ),
                  ],
                  onChanged: (val) {
                    xp.setPalette(val!);
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              t("Language"),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // chọn ngôn ngữ
            Container(
              decoration: GalaxyPinkTheme.glassDecoration(),
              child: ListTile(
                title: Text(t("App Language")),
                trailing: DropdownButton<Locale>(
                  value: lp.locale,
                  dropdownColor: GalaxyPinkTheme.spaceBase,
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text("English"),
                    ),
                    DropdownMenuItem(
                      value: Locale('vi'),
                      child: Text("Tiếng Việt"),
                    ),
                  ],
                  onChanged: (val) {
                    lp.setLocale(val!);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
