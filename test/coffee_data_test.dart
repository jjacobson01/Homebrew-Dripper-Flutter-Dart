//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test("Test that 'Sweet Maria's' recipe and list shows", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    //Test 'Sweet Maria' and list
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "Sweet Maria's");
    expect(recipes[0].steps, isA<List<RecipeStep>>());
  });
  test("Test that 'Grimpeur' recipe and list shows", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    //Test 'Grimpeur' and list
    expect(recipes[1], isA<CoffeeRecipe>());
    expect(recipes[1].name, "Grimpeur");
    expect(recipes[1].steps, isA<List<RecipeStep>>());
  });
  test("Test that 'Food & Wine' recipe and list shows", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    //Test 'Food & Wine' and list
    expect(recipes[2], isA<CoffeeRecipe>());
    expect(recipes[2].name, "Food & Wine");
    expect(recipes[2].steps, isA<List<RecipeStep>>());
  });
  test("Test that 'Blue Bottle' recipe and list shows", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    //Test 'Blue Bottle' and list
    expect(recipes[3], isA<CoffeeRecipe>());
    expect(recipes[3].name, "Blue Bottle");
    expect(recipes[3].steps, isA<List<RecipeStep>>());
  });

  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    //Test 'Test Recipe' and list
    expect(recipes[4], isA<CoffeeRecipe>());
    expect(recipes[4].name, "Test Recipe");
    expect(recipes[4].steps, isA<List<RecipeStep>>());
  });
}
