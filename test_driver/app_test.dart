// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';

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

  final mariasButton = find.byValueKey("Sweet Maria's");
  final grimpeurButton = find.byValueKey("Grimpeur");
  final coffeeGrams = find.byValueKey("coffee");
  final waterGrams = find.byValueKey("water");
  final bckButton = find.byValueKey('detailsbckbutton');
  final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
  group('Homebrew happy paths', () {
    test(
        /*
    Given I am on the Recipe Selection Page
    When I tap "Sweet Maria's"
    Then I should see " Sweet Maria's 22 360"
  */
        'Check that move to next page after selecting Sweet Marias Recipe works',
        () async {
      expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
      await driver.tap(mariasButton);
      await Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(mariasButton), "Sweet Maria's");
      expect(await driver.getText(coffeeGrams), "22");
      expect(await driver.getText(waterGrams), "360");
    });

    test(
        /*
    Given I am on the Maria's Detail Page
    When I tap the backbutton
    Then I should see " Sweet Maria's 22 360"
  */
        "From Sweet Maria's detail screen, will use back button to go back to homescreen",
        () async {
      expect(await driver.getText(mariasButton), "Sweet Maria's");
      await driver.tap(bckButton);
      expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
      await Future.delayed(const Duration(seconds: 1));
    });
  });

  test(
      /*
    Given I am on the Recipe Selection Page
    When I tap "Grimpeur"
    Then I should see "Grimpeur 20 300"
  */
      'Check that move to next page after selecting Grimpeur Recipe works',
      () async {
    expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
    await driver.tap(grimpeurButton);
    await Future.delayed(const Duration(seconds: 1));
    expect(await driver.getText(grimpeurButton), "Grimpeur");
    expect(await driver.getText(coffeeGrams), "22");
    expect(await driver.getText(waterGrams), "365");
  });

  test(
      /*
    Given I am on the Maria's Detail Page
    When I tap the backbutton
    Then I should see " Sweet Maria's 22 360"
  */
      "From Grimpeur's detail screen, will use back button to go back to homescreen",
      () async {
    expect(await driver.getText(grimpeurButton), "Grimpeur");
    await driver.tap(bckButton);
    expect(await driver.getText(coffeeRecipesTextFinder), 'Coffee Recipes');
    await Future.delayed(const Duration(seconds: 1));
  });
}
