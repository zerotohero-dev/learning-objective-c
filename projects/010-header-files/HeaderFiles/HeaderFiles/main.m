/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>
#include <stdio.h>
#include "mathfunctions.h"
#include "song.h"

int main(int argc, const char * argv[]) {

    int wholeNumbers[5] = {2,3,5,7,9};
    int theSum = sum(wholeNumbers, 5);
    
    printf ("The sum is: %i ", theSum);
    
    float fractionalNumbers[3] = {16.9, 7.86, 3.4};

    float theAverage = average(fractionalNumbers, 3);
    
    printf ("and the average is: %f \n", theAverage);

    Song allSongs[3];
    
    allSongs[0] = createSong ( "Hey Jude", 210, 2004 );
    allSongs[1] = createSong ( "Jambi", 256, 1992 );
    allSongs[2] = createSong ( "Lightning Crashes", 223, 1997 );
    
    return 0;
}

