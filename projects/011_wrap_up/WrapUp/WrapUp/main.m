/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>
#include <stdio.h> 
#include <stdlib.h> 
#include "mathfunctions.h" 
#include "song.h"

int  yearCount = 12;
int* allYears;

void setupYears();
int randomSongYear();

int main(int inputCount, char* inputValues[]) {
    char* values[] = {"lorem", "ipsum", "dolor", "amet"};
    
    inputValues = values;
    inputCount  = 4;
    
    // This will fail, because an array needs an explicit size or an initializer.
    // float test[];
    
    int songCount = (inputCount - 1);
  
    if (songCount > 0) {
        printf("You've entered %i song names \n", songCount);
    } else {
        printf("No songs? Boo! \n");
        
        exit(1);
    }
    
    setupYears();
    
    // random seed
    sranddev();
    
    Song allSongs[songCount];
    
    int songLengths[songCount];
    
    int i;
    
    for (i = 0; i < songCount; i++) {
        int length     = rand() % 500;
        int year       = randomSongYear();
        char* songName = inputValues[i+1];
        
        allSongs[i] = createSong (songName, length, year);
    
        songLengths[i] = length;
    }

    int combinedLength = sum(songLengths, songCount);
    
    printf ("The total length of all songs is %i seconds\n", combinedLength);
    
    float songLengthsAsFloats[songCount];
    
    for (i = 0; i < songCount; i++) {
        songLengthsAsFloats[i] = songLengths[i];
    }

    float averageLength = average(songLengthsAsFloats, songCount);
    
    printf ("The average length is: %.2f seconds\n", averageLength);
    
    // clean up the memory we malloced.
    free(allYears);

    return 0;
}

void setupYears() {

    // reserve memory for all of the year values.
    // we can't use dynamic allocation because years is a global variable.
    allYears = malloc(sizeof(int) * yearCount);
    
    int oneYear = 2000;
    
    // choose the starting year. int oneYear = 2000;
    // loop through and fill in each value. int i;
    for (int i = 0; i < yearCount; i++) {
        allYears[i] = ++oneYear;
    }
}

int randomSongYear() {
     return allYears[rand() % (yearCount-1)];
}















