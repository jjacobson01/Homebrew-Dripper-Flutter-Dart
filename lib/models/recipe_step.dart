import 'coffee_recipe.dart';

class RecipeStep {
  String text;
  int time;
  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (text.length == 0) {
      text = "No steps provided";
      if (time == null || time <= 0) {
        time = 1;
      } else
        this.time = time;
    }
    if (time == null || time <= 0) {
      this.text = text;
      time = 1;
    } else {
      this.text = text;
      this.time = time;
    }
  }
}
