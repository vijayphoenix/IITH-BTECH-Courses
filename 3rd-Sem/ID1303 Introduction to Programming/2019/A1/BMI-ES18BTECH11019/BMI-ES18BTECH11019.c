/*Program to Calculate BMI*/

#include <stdio.h>/*Pre-Processor*/
/*Function main begins program execution*/
int main(void) {
  long double W, H, BMI;    // defining varibles
  scanf("%Lf %Lf", &W, &H); // Taking input of Weight and Height from the
                            // user(Weight in Kgs and Height in meters)
  BMI = W / (H * H);        // BMI formula
  printf("%.4Lf\n", BMI);   // printing BMI on console up to 4 precision digits
  /*Determining whether UnderWeight or Normal or OverWeight or Obese and
   printing it on a new line on console*/
  if (BMI <= 18.5)
    printf("UnderWeight\n");
  else if (BMI > 18.5 && BMI <= 25)
    printf("Normal\n");
  else if (BMI > 25 && BMI <= 30)
    printf("OverWeight\n");
  else // BMI > 30 is Obese
    printf("Obese\n");
  return 0; /*Indicate program ended succesfully*/
} /*end function main*/
