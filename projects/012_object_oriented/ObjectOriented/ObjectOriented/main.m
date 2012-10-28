/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>

@interface Song : NSObject
    @property char* title;
    @property int   lengthInSeconds;
    @property int   yearRecorded;

    + (Song*) song;
    - (void)  display;
@end


//// Cocoa actually has two root classes: NSObject and NSProxy,
//// but almost all of your classes will inherit from NSObject.
@interface Game : NSObject
    @property char* playerOne;
    @property char* playerTwo;
    @property int   playerOneScore;
    @property int   playerTwoScore;
    @property int   durationInSeconds;
@end

@interface Computer : NSObject
    @property char* name;
    @property int cpuCount;
@end

@interface User : NSObject
    @property char* name;
    @property char* password;
@end

@interface GameComposed : NSObject
    // Assign is not okay for non-gc object.
    // https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html
    @property (retain) User* player;
    @property int id;
@end

int main(int argc, const char * argv[]) {
    // The Song object variable is a pointer.
    // All object variables in Objective-C are pointers because they're always
    // stored in dynamic memory—just as if you had allocated them
    // with the malloc() function. In fact, deep down in
    // Objective-C, that’s exactly what's happening.
    Song* mySong           = [Song song];

    mySong.title           = "Hey Jude";
    mySong.lengthInSeconds = 12;
    mySong.yearRecorded    = 2012;
    
    [mySong display];

    return 0;
}

