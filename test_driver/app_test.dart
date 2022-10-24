// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

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
  group('Happy Paths', ()  {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      // your code here

      final frechPressBtnFinder = find.byValueKey('french-press-sel');
      final ctnBtnFinder = find.byValueKey('ctn-btn-choose');
      final cupTxtFldFinder = find.byValueKey('cups-txt-fld');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');
      final recommendedRatioTxt =
          find.byValueKey('recommend-coffee-water-text');
      final doneBtnFinder = find.byValueKey('done-btn');

      await driver.tap(frechPressBtnFinder);
      await driver.tap(ctnBtnFinder);
      await driver.tap(cupTxtFldFinder);
      await driver.enterText('5');
      await driver.tap(cupCtnBtnFinder);

      expect(await driver.getText(recommendedRatioTxt),
          "63g - course ground coffee \n 887g - water");
      await driver.tap(doneBtnFinder);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      final dripMachineBtnFinder = find.byValueKey('drip-machine-sel');
      final ctnBtnFinder = find.byValueKey('ctn-btn-choose');
      final cupTxtFldFinder = find.byValueKey('cups-txt-fld');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');
      final recommendedRatioTxt =
          find.byValueKey('recommend-coffee-water-text');
      final doneBtnFinder = find.byValueKey('done-btn');

      await driver.tap(dripMachineBtnFinder);
      await driver.tap(ctnBtnFinder);
      await driver.tap(cupTxtFldFinder);
      await driver.enterText('5');
      await driver.tap(cupCtnBtnFinder);

      expect(await driver.getText(recommendedRatioTxt),
          "52g - medium ground coffee \n 887g - water");
      await driver.tap(doneBtnFinder);
    });
  });

  group('Sad Paths', ()  {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      //your code here
      final ctnBtnFinder = find.byValueKey('ctn-btn-choose');
      final makerTxtFinder = find.byValueKey('maker-selection');
      await driver.tap(ctnBtnFinder);
      expect(await driver.getText(makerTxtFinder),
          "What coffee maker are you using?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final frechPressBtnFinder = find.byValueKey('french-press-sel');
      final ctnBtnFinder = find.byValueKey('ctn-btn-choose');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');
      final cupQuestionFinder = find.byValueKey('cups-question-text');
      await driver.tap(frechPressBtnFinder);
      await driver.tap(ctnBtnFinder);
      await driver.tap(cupCtnBtnFinder);

      expect(await driver.getText(cupQuestionFinder),
          "How many cups would you like?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen 
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here

      final cupTxtFldFinder = find.byValueKey('cups-txt-fld');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');
      final cupQuestionFinder = find.byValueKey('cups-question-text');

      await driver.tap(cupTxtFldFinder);
      await driver.enterText('-1');
      await driver.tap(cupCtnBtnFinder);

      expect(await driver.getText(cupQuestionFinder),
          "How many cups would you like?");
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final inputBackBtnFinder = find.byValueKey('input-back-btn');
      final dripMachineBtnFinder = find.byValueKey('drip-machine-sel');
      final ctnBtnFinder = find.byValueKey('ctn-btn-choose');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');
      final cupQuestionFinder = find.byValueKey('cups-question-text');

      await driver.tap(inputBackBtnFinder);
      await driver.tap(dripMachineBtnFinder);
      await driver.tap(ctnBtnFinder);
      await driver.tap(cupCtnBtnFinder);

      expect(await driver.getText(cupQuestionFinder),
          "How many cups would you like?");
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here

      final cupTxtFldFinder = find.byValueKey('cups-txt-fld');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');
      final cupQuestionFinder = find.byValueKey('cups-question-text');

      await driver.tap(cupTxtFldFinder);
      await driver.enterText('-1');
      await driver.tap(cupCtnBtnFinder);

      expect(await driver.getText(cupQuestionFinder),
          "How many cups would you like?");
    });
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test('Input Back Button', () async {
      final inputBackBtnFinder = find.byValueKey('input-back-btn');
      final makerTxtFinder = find.byValueKey('maker-selection');

      await driver.tap(inputBackBtnFinder);

      expect(await driver.getText(makerTxtFinder),
          "What coffee maker are you using?");
    });
    test('recommended Back Button', () async {
      final cupQuestionFinder = find.byValueKey('cups-question-text');
      final recBackBtnFinder = find.byValueKey('recommended-back-btn');
      final dripMachineBtnFinder = find.byValueKey('drip-machine-sel');
      final ctnBtnFinder = find.byValueKey('ctn-btn-choose');
      final cupTxtFldFinder = find.byValueKey('cups-txt-fld');
      final cupCtnBtnFinder = find.byValueKey('ctn-btn-cups');

      await driver.tap(dripMachineBtnFinder);
      await driver.tap(ctnBtnFinder);
      await driver.tap(cupTxtFldFinder);
      await driver.enterText('5');
      await driver.tap(cupCtnBtnFinder);
      await driver.tap(recBackBtnFinder);

      expect(await driver.getText(cupQuestionFinder),
          "How many cups would you like?");
      


    });
  });
}
