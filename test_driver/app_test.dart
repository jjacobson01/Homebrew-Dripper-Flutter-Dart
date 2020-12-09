// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'dart:io';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  final coffeeGrams = find.byValueKey("coffee");
  final waterGrams = find.byValueKey("water");
  //details back button
  final bckButton = find.byValueKey('detailsbckbutton');
  final startButton = find.byValueKey('startButton');

  //final bckButton1 = find.byValueKey('stepsbckbutton');
  final doneScreen = find.byValueKey('doneScreen');
  // doneBackBtn = find.byValueKey('doneBackbtn');
  final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

  group('Homebrew happy paths', () {
    test(
        /*
          Given I am at the Recipe Selection Screen
          when I tap "Test Recipe" button
          Then I should be sent to the recipe detail page of Test Recipe
        */
        "Check that 'Test Recipe' recipe detail page comes up", () async {
      final testButton = find.byValueKey("Test Recipe");

      expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
      await driver.tap(testButton);
      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(testButton), "Test Recipe");
      expect(await driver.getText(coffeeGrams), "22g - finely ground coffee");
      expect(await driver.getText(waterGrams), "360g - water");
    });
    test(
        /*
         Given that I am on Test Recipe details page
         When I tap the start button
         Then I should see "Add 360g water"
         and should go through all 5 steps
         Then should go to done page
        */
        "Check steps of 'Test Recipe' Recipe", () async {
      final testButton = find.byValueKey("Test Recipe");
      final recipeStep = find.byValueKey('Add 360g water');
      final recipeStep1 = find.byValueKey('Cover and wait');
      final recipeStep2 = find.byValueKey('Stir');
      final doneButton = find.byValueKey('donebtn');

      expect(await driver.getText(testButton), "Test Recipe");
      await driver.tap(startButton);
      expect(await driver.getText(recipeStep), 'Add 360g water');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep1), 'Cover and wait');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep2), 'Stir');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep1), 'Cover and wait');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep2), 'Stir');
      await Future.delayed(const Duration(seconds: 3), () {});
      expect(await driver.getText(doneScreen),
          'enjoy your amazing \n handmade coffee');
      await driver.tap(doneButton);
    });

    test(
        /*
          Given I am at the Recipe Selection Screen
          when I tap "Food and Wine" button
          Then I should be sent to the recipe detail page of Food & Wine
        */
        "Check that 'Food & Wine' recipe detail page comes up", () async {
      final foodWineButton = find.byValueKey("Food & Wine");

      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
      await driver.tap(foodWineButton);
      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(foodWineButton), "Food & Wine");
      expect(await driver.getText(coffeeGrams), "20g - medium ground coffee");
      expect(await driver.getText(waterGrams), "300g - water");
    });

    test(
        /*
         Given that I am on Food & Win details page
         When I tap the start button
         Then I should see "Add 300g water"
         and should go through all 5 steps
         Then should go to done page
        */
        "Check steps of 'Food & Wine' Recipe", () async {
      final foodWineButton = find.byValueKey("Food & Wine");
      final recipeStep = find.byValueKey('Add 300g water');
      final recipeStep1 = find.byValueKey('Let stand, covered');
      final recipeStep2 = find.byValueKey('Uncover and quickly stir');
      final recipeStep3 = find.byValueKey('Stir coffee once more');
      final doneButton = find.byValueKey('donebtn');
      expect(await driver.getText(foodWineButton), "Food & Wine");
      await driver.tap(startButton);
      expect(await driver.getText(recipeStep), 'Add 300g water');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep1), 'Let stand, covered');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep2), 'Uncover and quickly stir');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep1), 'Let stand, covered');
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(recipeStep3), 'Stir coffee once more');
      await Future.delayed(const Duration(seconds: 2), () {});
      //expect(await driver.getText(doneScreen),'enjoy your amazing \n handmade coffee');
      await Future.delayed(const Duration(seconds: 1), () {});
      await driver.tap(doneButton);
    });

    test(
        /*
      Given I am on the Recipe Selection Page
      When I tap "Sweet Maria's"
      Then I should see " Sweet Maria's 22 360"
    */
        'Check that move to next page after selecting Sweet Marias Recipe works',
        () async {
      final mariasButton = find.byValueKey("Sweet Maria's");

      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
      await driver.tap(mariasButton);
      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(mariasButton), "Sweet Maria's");
      expect(await driver.getText(coffeeGrams), "22g - finely ground coffee");
      expect(await driver.getText(waterGrams), "360g - water");
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(bckButton);
    });

    // test(
    //     /*
    //   Given I am on the Maria's Detail Page
    //   When I tap the start button
    //   Then I should see "Add 360g water"
    //   when I tap the back button
    //   then I should see Maria's Detail Page
    //   when I tap the back button again
    //   then I should see Recipe Selection page
    // */
    //     "From Sweet Maria's detail screen, will use back button to go back to homescreen",
    //     () async {
    //   final mariasButton = find.byValueKey("Sweet Maria's");
    //   final recipeStep = find.byValueKey('Add 360g water');

    //   expect(await driver.getText(mariasButton), "Sweet Maria's");
    //   await driver.tap(startButton);
    //   expect(await driver.getText(recipeStep), 'Add 360g water');
    //   await Future.delayed(const Duration(seconds: 1));
    //   await driver.tap(bckButton);
    //   expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
    //   await Future.delayed(const Duration(seconds: 1));
    //   await driver.tap(bckButton);
    // });

    test(
        /*
      Given I am on the Recipe Selection Page
      When I tap "Grimpeur"
      Then I should see "Grimpeur 20 300"
    */
        'Check that move to next page after selecting Grimpeur Recipe works',
        () async {
      final grimpeurButton = find.byValueKey("Grimpeur");

      expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
      await driver.tap(grimpeurButton);
      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(grimpeurButton), "Grimpeur");
      expect(await driver.getText(coffeeGrams),
          "22g - medium to coarse filter drip grind");
      expect(await driver.getText(waterGrams), "365g - water");
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(bckButton);
    });

    //   test(
    //       /*
    //     Given I am on the Maria's Detail Page
    //     When I tap the backbutton
    //     Then I should see " Sweet Maria's 22 360"
    //   */
    //       "From Grimpeur's detail screen, will use back button to go back to homescreen",
    //       () async {
    //     final grimpeurButton = find.byValueKey("Grimpeur");
    //     final recipeStep100 = find.byValueKey('Add 100g water');

    //     expect(await driver.getText(grimpeurButton), "Grimpeur");
    //     await driver.tap(startButton);
    //     expect(await driver.getText(recipeStep100), 'Add 100g water');

    //     await Future.delayed(const Duration(seconds: 1));
    //     await driver.tap(bckButton);
    //     expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
    //     await Future.delayed(const Duration(seconds: 1));
    //   });
  });
}
