import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;
  List<RecipeStep> fix = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (name == "" || name == null) {
      name = "Sweet Maria's";
    }
    if (coffeeVolumeGrams < 0) {
      coffeeVolumeGrams = 20;
    }
    if (waterVolumeGrams < 0) {
      waterVolumeGrams = 360;
    }
    if (grindSize == "") {
      grindSize = "finely ground coffee";
    }
    if (steps.length == 0) {
      steps = fix;
    }
    if (miscDetails == "" || miscDetails == null) {
      miscDetails = "The original recipe: makes one delicious cup";
    }

    this.name = name;
    this.coffeeVolumeGrams = coffeeVolumeGrams;
    this.waterVolumeGrams = waterVolumeGrams;
    this.grindSize = grindSize;
    this.miscDetails = miscDetails;
    this.steps = steps;
  }
}
