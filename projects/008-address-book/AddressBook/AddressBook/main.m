/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#include <stdio.h>

int main (int inputCount, char* inputValues[] ) {
    int nameCount = (inputCount - 1);
    
    if (nameCount > 0) {
        printf("You have entered %i names \n", nameCount);
    } else {
        printf("No names :(");
    }
    
    char* formattedNames[nameCount];
    
    int i = 0;

    for (i = 0; i < nameCount; i++ ) {
        char* currentName = inputValues[i+1];
        asprintf(&formattedNames[i], "Name %i: %s", i, currentName);
    }

    for (i = 0; i < nameCount; i++) {
        printf("%s \n", formattedNames[i]);
    }
    
    // Good boys clean their mess.
    for (i = 0; i < nameCount; i++ ) {
        free(formattedNames[i]);
    }

    return 0;
}

