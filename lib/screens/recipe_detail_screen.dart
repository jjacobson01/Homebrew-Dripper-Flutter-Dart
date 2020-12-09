import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

import '../models/coffee_recipe.dart';
import '../models/recipe_step.dart';

extension on Duration {
  String format() => '$this'.substring(2, 7);
}

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;
  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4C748B),
          ),
          key: Key('detailsbckbutton'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4c748b), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  recipe.name,
                  key: Key(recipe.name),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 18,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                SizedBox(height: 10),
                Divider(
                    thickness: 1,
                    color: Color(0xff4C748B),
                    height: 0,
                    indent: 20,
                    endIndent: 20),
                SizedBox(height: 30),
                Text(
                  "${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}",
                  key: Key("coffee"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 14,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                Text(
                  "${recipe.waterVolumeGrams}g - water",
                  key: Key("water"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 14,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                SizedBox(height: 40),
                Text(
                  "${recipe.miscDetails}",
                  key: Key("detail"),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                      fontSize: 10,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Steps",
                key: Key("steps"),
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 14,
                    letterSpacing: 2,
                    color: Color(0xff4c748b)),
              ),
              Text(
                "Total: ", //to-do insert total step time here
                key: Key("time"),
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 12,
                    letterSpacing: 2,
                    color: Color(0xff4c748b)),
              ),
            ],
          ),
          Column(
            children: [
              for (RecipeStep step in recipe.steps)
                new Container(
                  margin: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4c748b), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                      title: Text(step.text,
                          style: TextStyle(
                              fontFamily: 'Kollektif',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Color(0xff4c748b))),
                      trailing: Text(
                          Duration(seconds: step.time).format().toString(),
                          style: TextStyle(
                              fontFamily: 'Kollektif',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Color(0xff4c748b)))),
                )
            ],
          ),
          RaisedButton(
            color: Color(0xff4c748b),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15)),
            child: Text("Start",
                key: Key('startButton'),
                style: TextStyle(fontSize: 14, color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeStepsScreen(recipe)),
              );
            },
          )
        ],
      ),
    );
  }
}
