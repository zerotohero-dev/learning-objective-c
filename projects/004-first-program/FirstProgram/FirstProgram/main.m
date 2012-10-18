/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 *
 *  lastModified: 2012-10-07 10:48:25.262318
 */

#include <stdio.h>

int  sum        (int x, int y);
void myFunction ();

// If you use the static keyword with a global variable, it will only be
// visible within the same file. Marking global variables as static
// means they won't collide with global variables in other files.
static int myStaticGlobal = 42;

int sum(int x, int y) {return x + y;}

void myFunction () {
    // Static variables are initialized only once.
    // And they are used afterwards.
    static int numberOfCalls = 1;
    
    printf("This function has been called %i times\n", numberOfCalls);
    
    numberOfCalls++;
}

int   totalItems = 0;
float totalCost  = 0.0;
float salesTax   = 0.0925;

void  addTotal(float cost, int quantity);
float getCostWithSalesTax(float price);

/**
 *
 */
float getCostWithSalesTax(float price) {
    float taxAmount = price * salesTax;
    float subtotal  = price + taxAmount;
    
    return subtotal;
}

/**
 *
 */
void addTotal(float cost, int quantity) {
    printf("Adding %i items of cost %5.2f\n", quantity, cost);
    
    float calculatedCost = cost * quantity;
    float realCost       = getCostWithSalesTax(calculatedCost);
    
    totalCost  += realCost;
    totalItems += quantity;
    
    printf("Subtotal for %i items: %5.2f\n", totalItems, totalCost);
}

/**
 *
 */
int main(int argc, const char * argv[]) {
    float budget =  20000.00;
    
    printf("\n");
    
    float laptopPrice  = 1899.00;
    float monitorPrice = 512.22;
    float tabletPrice  = 1099.23;
    
    addTotal(laptopPrice , 2);
    addTotal(monitorPrice, 4);
    addTotal(tabletPrice , 3);
    
    if (totalCost < budget) {
        printf("Under budget! Yay!\n");
    } else {
        printf("Over budget! Boo!\n");
    }
    
    // C really likes numbers. Everything boils down to a number at some level,
    // so even true/false statements are ultimately a 1 (true) or 0 (false).
    // As a result, this code is technically correct:
    if (1   ) {printf("trueeeey\n");}
    if (42  ) {printf("yippie!\n"); }
    if (-123) {printf("worldie!\n");}
    
    for (int i = 0; i < 20; i++) {
        myFunction();
    }
    
    int total = sum (2, 10);
    
    printf ( "Total: %i \n", total );

    return 0;
}
