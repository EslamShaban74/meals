import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:meal/components/drawer/drawer.dart';
import 'package:meal/providers/theme_provider/theme_provider.dart';
import 'package:meal/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = 'theme';

  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropdownValue = 'English - UK';

  buildRadioListTile(
    ThemeMode themeVal,
    String title,
    IconData icon,
    context,
  ) {
    return RadioListTile(
      value: themeVal,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      secondary: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      groupValue: Provider.of<ThemeProvider>(context).themeMode,
      onChanged: (newThemeValue) =>
          Provider.of<ThemeProvider>(context, listen: false)
              .themeModeChange(newThemeValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settings.tr(),
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                LocaleKeys.adjust_your_settings_selection.tr(),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    LocaleKeys.choose_your_theme_mode.tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                buildRadioListTile(
                    ThemeMode.system,
                    LocaleKeys.system_default_theme.tr(),
                    Icons.phone_android,
                    context),
                buildRadioListTile(ThemeMode.light, LocaleKeys.light_theme.tr(),
                    Icons.wb_sunny_outlined, context),
                buildRadioListTile(ThemeMode.dark, LocaleKeys.dark_theme.tr(),
                    Icons.nights_stay_outlined, context),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    LocaleKeys.choose_your_app_language.tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                //  RadioListTile(value: Locale('en'), groupValue: groupValue, onChanged: onChanged)
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: .9),
                  ),
                  child: Container(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          DropdownButton<String>(
                            dropdownColor: Theme.of(context).primaryColor,
                            elevation: 16,
                            value: dropdownValue,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              color: Colors.transparent,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue == 'English - UK') {
                                  setState(() {
                                    dropdownValue = 'English - UK';

                                    context.setLocale(const Locale('en'));
                                  });
                                } else if (newValue == 'العربية - ar') {
                                  setState(() {
                                    dropdownValue = 'العربية - ar';

                                    context.setLocale(const Locale('ar'));
                                  });
                                }
                              });
                            },
                            items: <String>['English - UK', 'العربية - ar']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontSize: 15)),
                              );
                            }).toList(),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
