/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#include <stdio.h>

int sum (int values[], int count) {
    int i;
    int total = 0;
 
    for (i = 0; i < count; i++) {
        total += values[i];
    }
    
    return total;
}

float average(float values[], int count) {
    int i;
    float total = 0.0;
    
    for (i = 0; i < count; i++ ) {
        total = total + values[i];
    }

    float average = (total / count);
    
    return average;
}