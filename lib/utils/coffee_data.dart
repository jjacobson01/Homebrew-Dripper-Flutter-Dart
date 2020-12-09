import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe grimpeurRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 100g water", 25),
    RecipeStep("Let coffee bloom", 15),
    RecipeStep("Stir while adding 265g water", 15),
    RecipeStep("Continue to stir coffee slurry", 90),
    RecipeStep("Drip and filter", 90),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Grimpeur", 22, 365,
      "medium to coarse filter drip grind", "a la Houndstooth Coffee", steps);
  return recipe;
}

CoffeeRecipe foodWineRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 300g water", 1),
    RecipeStep("Let stand, covered", 1),
    RecipeStep("Uncover and quickly stir", 1),
    RecipeStep("Let stand, covered", 1),
    RecipeStep("Stir coffee once more", 1),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Food & Wine",
      20,
      300,
      "medium ground coffee",
      "makes a single cup of full-flavored, light-bodied coffee",
      steps);
  return recipe;
}

CoffeeRecipe blueBottleRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Boil 350g water", 25),
    RecipeStep("Grind 23 grams of coffee", 60),
    RecipeStep("Bloom coffee", 15),
    RecipeStep("Pour water slowly while stirring", 15),
    RecipeStep("Let coffee continue to drip", 30),
    RecipeStep("Pour additional 100g water", 20),
    RecipeStep("Cover and wait", 20),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Blue Bottle",
      23,
      450,
      "medium ground coffee",
      "the final cup is noticeably more delicate and complex",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 1),
    RecipeStep("Cover and wait", 1),
    RecipeStep("Stir", 1),
    RecipeStep("Cover and wait", 1),
    RecipeStep("Stir", 1),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    grimpeurRecipe(),
    foodWineRecipe(),
    blueBottleRecipe(),
    makeTestRecipe()
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
