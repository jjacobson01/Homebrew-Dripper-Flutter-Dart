import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  //
  RecipeStep stepTest = RecipeStep("Hot Chocolate > Coffee", 15);
  RecipeStep fixStep = RecipeStep("", -1);
  test("Make a recipe step and test", () {
    expect(stepTest.text, ("Hot Chocolate > Coffee"));
    expect(stepTest.time, 15);
  });

  test('default values go in place of invalid inputs', () {
    expect(fixStep.text, "No steps provided");
    expect(fixStep.time, 1);
  });
}
