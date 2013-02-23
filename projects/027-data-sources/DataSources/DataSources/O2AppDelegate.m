/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2AppDelegate.h"

@interface O2AppDelegate (Private)
    + (id) guestWithName:(NSString*)name;
    - (void) setupDefaultGuests;
@end

@implementation O2AppDelegate
    NSString* const GBNameIdentifier = @"name";
    NSString* const GBDateIdentifier = @"date";

    - (void)dealloc {
        self.guests = nil;
        self.guestTableView = nil;

        [super dealloc];
    }

    - (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
        [self setupDefaultGuests];
    }
@end
