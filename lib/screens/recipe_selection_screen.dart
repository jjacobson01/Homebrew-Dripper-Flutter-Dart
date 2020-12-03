import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
//import 'dart:js' as js;

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*
        appBar: AppBar(
          title: Text("Recipe Selection"),
        ), */
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Coffee Recipes",
              key: Key("coffee-recipes"),
              style: TextStyle(
                  fontFamily: 'Kollektif',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color(0xff4c748b))),
          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4c748b), width: 3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: RecipeList(),
          ),
          //RecipeList(),
          Text("Resources",
              style: TextStyle(
                  fontFamily: 'Kollektif',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color(0xff4c748b))),
          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4c748b), width: 3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ResourceList(),
          ),
          //ResourceList()
        ],
      ),
    ));
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeRecipe recipe in recipes)
          Column(children: [
            ListTile(
                title: Text(recipe.name),
                trailing: Icon(
                  Icons.chevron_right,
                  key: Key(recipe.name),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe)),
                  );
                }),
            Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
          ]),
      ],
    );
  }
}

class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text("Coffee"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              /*Navigator.push(
                  context,*/
              /*js.context.callMethod(
                  'open', ['https://www.coffeestore.com/corona/beans.html']);*/
            }),
        Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
        ListTile(
            title: Text("Grinders"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              /*Navigator.push(
                  context,*/
              /*js.context.callMethod(
                  'coffee', ['https://www.coffeestore.com/corona/beans.html']);*/
            }),
        Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
        ListTile(
            title: Text("Kettles"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              /*Navigator.push(
                  context,*/
              /*js.context.callMethod(
                  'coffee', ['https://www.coffeestore.com/corona/beans.html']);*/
            }),
        Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
        ListTile(
            title: Text("Homewbrew Dripper"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              /*Navigator.push(
                  context,*/
              /*js.context.callMethod(
                  'coffee', ['https://www.coffeestore.com/corona/beans.html']);*/
            }),
      ],
    );
  }
}
