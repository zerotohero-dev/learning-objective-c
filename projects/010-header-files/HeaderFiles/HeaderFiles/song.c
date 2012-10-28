/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#include <stdio.h>
#include "song.h"

Song createSong(char* title, int length, int year) {
    Song mySong;
    
    mySong.lengthInSeconds = length;
    mySong.yearRecorded    = year;
    mySong.title           = title;
    
    displaySong(mySong);
    
    return mySong;
}

void displaySong (Song theSong) {
    printf("'%s' is %i seconds long ", theSong.title, theSong.lengthInSeconds);
    printf("and was recorded in %i\n", theSong.yearRecorded);
}