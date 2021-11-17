import 'package:flutter/material.dart';
import 'package:meal/components/drawer/drawer.dart';
import 'package:meal/providers/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = 'theme';

  buildRadioListTile(
    ThemeMode themeVal,
    String title,
    IconData icon,
    context,
  ) {
    return RadioListTile(
      value: themeVal,
      title: Text(title,style: Theme.of(context).textTheme.bodyText1,),
      secondary: Icon(icon,color: Theme.of(context).iconTheme.color,),
      groupValue: Provider.of<ThemeProvider>(context).themeMode,
      onChanged: (newThemeValue) =>
          Provider.of<ThemeProvider>(context,listen: false).themeModeChange(newThemeValue),
    );
  }

  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Themes',
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
                'Adjust your Theme Selection!',
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
                    'Choose your theme mode',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                buildRadioListTile(ThemeMode.system, 'System Default Theme',
                    Icons.phone_android, context),
                buildRadioListTile(ThemeMode.light, 'Light Theme',
                    Icons.wb_sunny_outlined, context),
                buildRadioListTile(ThemeMode.dark, 'Dark Theme',
                    Icons.nights_stay_outlined, context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
