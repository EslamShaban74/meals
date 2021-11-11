import 'package:flutter/material.dart';
import 'package:meal/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:meal/screens/filters_screen/filters_screen.dart';

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
        color: Theme.of(context).canvasColor,
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
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Stack(
                children: [
                  Image.network(
                    'https://image.freepik.com/free-photo/pasta-colored-farfalle-salad-with-tomatoes-mozzarella-basil_2829-14395.jpg',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 8.0,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(40, 15, 15, 15),
                      color: Colors.black.withOpacity(0.6),
                      child: Text(
                        'Foodiaa!',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            buildListTile(
              'Meals',
              Icons.restaurant,
              () {
                Navigator.of(context).pushNamed(BottomNavBar.routeName);
              },
              context,
            ),
            //const SizedBox(height: 10.0),
            buildListTile(
              'Filters',
              Icons.list,
              () {
                Navigator.pushNamed(context, FiltersScreen.routeName);
              },
              context,
            )
          ],
        ),
      ),
    );
  }
}
