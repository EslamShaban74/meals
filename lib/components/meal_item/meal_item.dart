import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meals_details_screen/meals_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(context) {
    Navigator.of(context)
        .pushNamed(
      MealsDetailsScreen.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        //   removeMeal(value);
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(

        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Hero(
                    tag: id,
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              Icons.schedule,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '$duration min',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              Icons.work,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              complexityText,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              Icons.attach_money,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          //  const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              affordabilityText,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
