/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

// Function Declerations
int   numberOfPeople  ();
float dollarsAndCents ();
int   timesTen        (int x);
int   difference      (int input1, int input2);

// Function Implementation
int numberOfPeople() {return 3;}

// Enumerations
enum { monday, tuesday, wednesday, thursday, friday, saturday, sunday };

int day = saturday;

// Typedefs
typedef int Distance;

Distance homeToOffice = 30;
Distance officeToCafe = 3;

typedef enum {
    mon, tue, wed, thu, fri, sat, sun
} DayOfWeek;

DayOfWeek d = sat;

int main(int argc, char *argv[]) {
    return NSApplicationMain(argc, (const char **)argv);
}
