import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/screens/meals_screen/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
    required this.image,
  }) : super(key: key);

  void selectCategory(context) {
    Navigator.of(context).pushNamed(
      MealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Theme.of(context).primaryColor,
                  // gradient: LinearGradient(colors: [
                  //   HexColor('#9EBAF3'),
                  //   HexColor('#082032')
                  //   //HexColor('#353A5F'),
                  // ]),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                padding: const EdgeInsets.fromLTRB(15, 7, 0, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      height: MediaQuery.of(context).size.height * 0.27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 25.0),
                    Expanded(
                        child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline3,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: IconButton(
                          iconSize: 15.0,
                          onPressed: () {
                            selectCategory(context);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,

                          ),
                          //color: HexColor('#212121'),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
