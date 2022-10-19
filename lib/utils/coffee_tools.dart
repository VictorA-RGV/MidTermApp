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
    if(maker == 0){ // for every 1 gram of coffee using a french press there is 14 grams of water.
          // french press requires 177.42 / 14 to produce the grams for 1 cup of coffee. 12.672857...;
          if(cups <= 0){throw ArgumentError();}
          else return([(cupsToOunces(cups)*177.42) , ((cupsToOunces(cups)*177.42) / 14)]);
    }
    // for every 1 gram of coffee using a drip machine there is 17 grams of water
  
    else{   
    if(cups <= 0){throw ArgumentError();}
    else return ([(cupsToOunces(cups)*177.42) , ((cupsToOunces(cups)*177.42) / 17)]); 
    }
    
    

  }
}
