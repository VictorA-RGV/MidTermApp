class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }
  // Input: coffee maker is either 0 - french press or 1 - drip machine. Number of cups
  // output: grams of water and grams of coffee. 
  static List ratioWaterCoffee (int maker, int cups){ 
    // for 1 cup of coffee there is 6 ounces of water. 
    // for every 6 ounces it is equal to 177.42 grams of water
    if(maker == 0){ 
          if(cups <= 0){throw ArgumentError();}
          else return([(cupsToOunces(cups)*29.57) , ((cupsToOunces(cups)*29.57) / 14)]);
    }
   
  
    if(maker == 1){   
    if(cups <= 0){throw ArgumentError();}
    else return ([(cupsToOunces(cups)*29.57) , ((cupsToOunces(cups)*29.57) / 17)]); 
    }
    
    

  }
}
