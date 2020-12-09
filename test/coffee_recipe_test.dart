import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test("Make Hot Chocolate, cuz baby it's cold outside!", () {
    /*
    Given that I provide a valid input for each argument and step
    Then I should see a new Coffee recipe created
    */
    List<RecipeStep> steps = [
      RecipeStep("pour 300g of water/milk", 15),
      RecipeStep("Cover and chill", 30),
      RecipeStep("Stir that deliciousness", 15),
      RecipeStep("Add some marshmellows in that bad boy", 30),
      RecipeStep("Stir and watch the marshmellows melt!", 15),
    ];

    CoffeeRecipe chocolateTest = CoffeeRecipe(
        "Hot Chocolate",
        300,
        20,
        "Chocolate powder",
        "Because hot chocolate tastes way better than coffee",
        steps);

    expect(chocolateTest.name, "Hot Chocolate");
    expect(chocolateTest.coffeeVolumeGrams, 300);
    expect(chocolateTest.waterVolumeGrams, 20);
    expect(chocolateTest.grindSize, "Chocolate powder");
    expect(chocolateTest.miscDetails,
        "Because hot chocolate tastes way better than coffee");
    expect(chocolateTest.steps[0].text, "pour 300g of water/milk");
    expect(chocolateTest.steps[0].time, 15);
    expect(chocolateTest.steps[1].text, "Cover and chill");
    expect(chocolateTest.steps[1].time, 30);
    expect(chocolateTest.steps[2].text, "Stir that deliciousness");
    expect(chocolateTest.steps[2].time, 15);
    expect(
        chocolateTest.steps[3].text, "Add some marshmellows in that bad boy");
    expect(chocolateTest.steps[3].time, 30);
    expect(
        chocolateTest.steps[4].text, "Stir and watch the marshmellows melt!");
    expect(chocolateTest.steps[4].time, 15);
  });

  test('Instead of rejecting, will convert invalid inputs into correct inputs',
      () {
    /*
        Given that the user inputs null text or negative numbers
        then will automate errors and put a default replacement.
        */
    List<RecipeStep> nullSteps = [];
    CoffeeRecipe fixRecipe = CoffeeRecipe("", -1, -1, "", "", nullSteps);

    expect(fixRecipe.name, "Sweet Maria's");
    expect(fixRecipe.coffeeVolumeGrams, 20);
    expect(fixRecipe.waterVolumeGrams, 360);
    expect(fixRecipe.grindSize, "finely ground coffee");
    expect(
        fixRecipe.miscDetails, "The original recipe: makes one delicious cup");
    expect(fixRecipe.steps[0].text, "Add 360g water");
    expect(fixRecipe.steps[0].time, 30);
    expect(fixRecipe.steps[1].text, "Cover and wait");
    expect(fixRecipe.steps[1].time, 90);
    expect(fixRecipe.steps[2].text, "Stir");
    expect(fixRecipe.steps[2].time, 15);
    expect(fixRecipe.steps[3].text, "Cover and wait");
    expect(fixRecipe.steps[3].time, 75);
    expect(fixRecipe.steps[4].text, "Stir");
    expect(fixRecipe.steps[4].time, 15);
  });
}
