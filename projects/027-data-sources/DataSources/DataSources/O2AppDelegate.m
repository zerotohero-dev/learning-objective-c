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

    // Private Methods

    + (id)guestWithName:(NSString *)name {
        if (name == nil) {
            name = @"New Guest";
        }

        NSMutableDictionary* guest = [NSMutableDictionary dictionary];

        [guest setObject:name forKey:GBNameIdentifier];
        [guest setObject:[NSDate date] forKey:GBDateIdentifier];
    }

    - (void)setupDefaultGuests {
        id guest= [[self class] guestWithName:@"Volkan Özçelik"];

        NSMutableArray *newGuests = [NSMutableArray array];
        [newGuests addObject:guest];

        self.guests = newGuests;

        [self.guestTableView reloadData];
    }

    // Action Methods

    - (IBAction)signIn:(id)sender {
        id guest = [[self class] guestWithName:nil];

        [self.guests addObject:guest];

        [ self.guestTableView reloadData];


        NSInteger columnIndex = [
                self.guestTableView columnWithIdentifier:GBNameIdentifier];

        [self.guestTableView editColumn: columnIndex
                                     row: [self.guests indexOfObject:guest]
                               withEvent: nil
                                  select: YES
        ];
    }

    // - (NSInteger) numberOfRowsInTableView: (NSTableView *)table;
    // - (id) tableView: (NSTableView *)table objectValueForTableColumn: (NSTableColumn *)column row: (NSInteger)row;
    // - - (void) tableView: (NSTableView *)table setObjectValue: (id)object
    // forTableColumn: (NSTableColumn *)column
    // row: (NSInteger)row;

    // You do not call these methods directly. i
    // Instead you wait for the consumer (NSTableView) needs the data and calls these
    // methods.
    // The only thing you have to do in your code is to call reloadData() of NSTableView
@end
