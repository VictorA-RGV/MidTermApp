import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });
  });

  group("recomended Ratios", () {
    test('French press test', () { // test to input french press, input cups, input ounces, output water and coffee in grams 
      var gramsRatio = [];
      int cups = 5;
      gramsRatio = CoffeeTools.ratioWaterCoffee(0, cups);
      expect(gramsRatio, [887.1,63.364285714285714]);
    });

    test('Drip Machine test', () { // test to input Drip Machine, input cups, input ounces, output water and coffee in grams 1/17
      int cups = 5;
      var gramsRatio = [];
      gramsRatio = CoffeeTools.ratioWaterCoffee(1, cups); 
      expect(gramsRatio, [887.1,52.182352941176475]);
    });

    test('French press invalid input 0', (){
      int cups = 0;
      
      expect(() =>  CoffeeTools.ratioWaterCoffee(0, cups), throwsArgumentError);
    });
    test('Drip Machine invalid input 0', (){
      int cups = 0;
      expect(() =>  CoffeeTools.ratioWaterCoffee(1, cups), throwsArgumentError);
    });
    test('French press invalid input negative', (){
      int cups = -1;
      
      expect(() =>  CoffeeTools.ratioWaterCoffee(0, cups), throwsArgumentError);
    });
    test('Drip Machine invalid input negative', (){
      int cups = -1;
      expect(() =>  CoffeeTools.ratioWaterCoffee(1, cups), throwsArgumentError);
    });

  });
}
