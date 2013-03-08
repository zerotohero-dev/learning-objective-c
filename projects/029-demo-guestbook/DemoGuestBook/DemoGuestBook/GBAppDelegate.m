/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "GBAppDelegate.h"

NSString* const NAME_IDENTIFIER = @"name";
NSString* const DATE_IDENTIFIER = @"date";

@interface GBAppDelegate (Private)
+ (id) guestWithName:(NSString*)name;
- (void) setupDefaultGuests;
@end

@implementation GBAppDelegate

@synthesize window;
@synthesize guestsTableView;
@synthesize guests;

- (void)dealloc {
    self.guestsTableView = nil;
    self.guests = nil;

    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //TODO: self
    [self setupDefaultGuests];
}

// Privates

- (void) setupDefaultGuests {
    NSLog(@"Setup default guests");

    // TODO: instance methods, versus class methods, self.
    id guest = [[self class] guestWithName:@"Volkan Özçelik"];

  //  NSLog( guest );

    NSMutableArray* newGuests = [NSMutableArray array];
    [newGuests addObject: guest];

//    NSLog( newGuests );

// TODO: improve time formats
// TODO: use a different class for databound methods

    self.guests = newGuests;

    NSLog( @"before reload" );

    [self.guestsTableView reloadData];

    NSLog( @"after reload" );
}

+ (id) guestWithName:(NSString*)name {
    if ( name == nil ) {
        name = @"New Guest";
    }

    NSMutableDictionary* guest = [NSMutableDictionary dictionary];

    [guest setObject: name          forKey: NAME_IDENTIFIER];
    [guest setObject: [NSDate date] forKey: DATE_IDENTIFIER];

    return guest;
}

// Action Methods

- (IBAction)signIn:(id)sender {
    NSLog(@"signin");
    id guest = [[self class] guestWithName:nil];

    [self.guests addObject:guest];

    [self.guestsTableView reloadData];

    NSInteger columnIndex = [self.guestsTableView columnWithIdentifier:NAME_IDENTIFIER];

    [self.guestsTableView editColumn: columnIndex
                                 row: [self.guests indexOfObject:guest]
                           withEvent: nil
                              select: YES];
}

// DataSource Methods

- (NSInteger) numberOfRowsInTableView:(NSTableView *)table {
    NSLog(@"count waned");
    return self.guests.count;
}

- (id) tableView: (NSTableView *)table
            objectValueForTableColumn: (NSTableColumn *)column row: (NSInteger)row {
    NSLog(@"Tableview wanted");

    NSDictionary* guest = [self.guests objectAtIndex:row];
    NSString* identifier = column.identifier;

    return [guest objectForKey:identifier];
}

- (void) tableView: (NSTableView *)table setObjectValue: (id)object
            forTableColumn: (NSTableColumn *)column row: (NSInteger)row {
    NSLog(@"Trying to set");

    NSMutableDictionary* guest = [self.guests objectAtIndex:row];
    NSString* identifier = column.identifier;

    [guest setObject:object forKey:identifier];
}

//TODO: protocols versus categories

//@protocol NSTableViewDataSource <NSObject>
//- (NSInteger) numberOfRowsInTableView: (NSTableView *)table;
//- (id) tableView: (NSTableView *)table objectValueForTableColumn: (NSTableColumn *)column row: (NSInteger)row;
//- (void) tableView: (NSTableView *)table setObjectValue: (id)object
//forTableColumn: (NSTableColumn *)column
//row: (NSInteger)row; @end

@end
