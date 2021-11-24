import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:meal/screens/filters_screen/filters_screen.dart';
import 'package:meal/screens/settings_screen/settings_screen.dart';


import 'package:meal/translations/locale_keys.g.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
    String title,
    IconData icon,
    VoidCallback tabHandler,
    context,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Stack(
                children: [
                  const FadeInImage(
                    image: NetworkImage(
                      'https://image.freepik.com/free-photo/pasta-colored-farfalle-salad-with-tomatoes-mozzarella-basil_2829-14395.jpg',

                    ),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/a2.png'),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 8.0,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(40, 15, 15, 15),
                      color: Colors.black.withOpacity(0.6),
                      child: Text(
                        LocaleKeys.drawer_title.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            buildListTile(
              LocaleKeys.title.tr(),
              Icons.restaurant,
              () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              context,
            ),
            //const SizedBox(height: 10.0),
            buildListTile(
              LocaleKeys.filters.tr(),
              Icons.list,
              () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              },
              context,
            ),
            buildListTile( LocaleKeys.settings.tr(), Icons.settings, () {
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
            }, context)
          ],
        ),
      ),
    );
  }
}
