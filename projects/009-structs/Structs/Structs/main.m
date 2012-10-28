/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#include <stdio.h>

typedef struct {
    char* title;
    int   lengthInSeconds;
    int   yearRecorded;
} Song;

Song createSong(char * title, int lengthInSeconds, int yearRecorded) {
    Song song1;

    song1.title           = title;
    song1.lengthInSeconds = lengthInSeconds;
    song1.yearRecorded    = yearRecorded;

    return song1;
}

int main (int inputCount, char* inputValues[] ) {
    Song song1;
    song1.title           = "In the middle of the night";
    song1.lengthInSeconds = 200;
    song1.yearRecorded    = 2001;

    Song song2;
    song2.title           = "Let it be";
    song2.lengthInSeconds = 325;
    song2.yearRecorded    = 1970;
    
    return 0;
}

