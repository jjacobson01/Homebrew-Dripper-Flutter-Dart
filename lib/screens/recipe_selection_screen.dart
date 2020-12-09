import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  //fontFamily: 'Kollektif',
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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeRecipe recipe in recipes)
          Column(children: [
            ListTile(
                title: Text(recipe.name,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        letterSpacing: 2,
                        color: Color(0xff4c748b))),
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
            if (recipe.name != "Test Recipe")
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
            title: Text("Coffee",
                style: TextStyle(
                    fontFamily: 'Monserrat',
                    fontSize: 14,
                    letterSpacing: 2,
                    color: Color(0xff4c748b))),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final url = 'https://www.coffeestore.com/corona/beans.html';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false,
                );
              }
            }),
        Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
        ListTile(
            title: Text(
              "Grinders",
              style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Color(0xff4c748b)),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final url = 'https://www.coffeestore.com/grinders.html';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false,
                );
              }
            }),
        Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
        ListTile(
            title: Text(
              "Kettles",
              style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Color(0xff4c748b)),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final url = 'https://prima-coffee.com/brew/coffee/kettles';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false,
                );
              }
            }),
        Divider(thickness: 1, color: Color(0xff4C748B), height: 0),
        ListTile(
            title: Text(
              "Homebrew Dripper",
              style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Color(0xff4c748b)),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final url = 'https://www.coffeestore.com/barista/brewing.html';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false,
                );
              }
            }),
      ],
    );
  }
}
