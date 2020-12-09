import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

extension on Duration {
  String format() => '$this'.substring(2, 7);
}

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: new Color(0xFF4C748B),
      body: ListView(
        children: [
          Divider(
            height: 50,
          ),
          Text(
            "${stepTimeRemaining}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: new Color(0xFFFFFFFF),
              fontSize: 96,
              fontFamily: 'Kollektif',
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            "${currentRecipeStep.text}",
            key: Key(currentRecipeStep.text),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: new Color(0xFFFFFFFF),
              fontSize: 24,
              fontFamily: 'Kollektif',
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            "Steps",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: new Color(0xFFFFFFFF),
              fontSize: 14,
              fontFamily: 'Kollektif',
            ),
          ),
          for (RecipeStep step in remainingSteps)
            ListTile(
              title: Text(
                step.text,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: new Color(0xFFFFFFFF),
                  fontSize: 12,
                  fontFamily: 'Kollektif',
                ),
              ),
              trailing: Text(Duration(seconds: step.time).format().toString(),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Color(0xFFFFFFFF))),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
