/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2AppDelegate.h"
#import "Person.h"

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

        Person* myPerson = [[Person alloc] init];

        myPerson.firstName = @"Joe";

        [myPerson setValue:@"Bob" forKey:@"firstName"];
        [myPerson setValue:@"Smith" forKey:@"lastName"];

        // get value using KVC.
        NSLog(@"myPerson firstName: %@", [myPerson valueForKey:@"firstName"]);

        // get value using normal accessor.
        NSLog(@"myPerson lastName: %@", myPerson.lastName);

        [myPerson release];

        Person* myPerson1 = [[[Person alloc] init] autorelease]; [myPerson1 setValue:@"Paul" forKey:@"firstName"];
        Person* myPerson2 = [[[Person alloc] init] autorelease]; [myPerson2 setValue:@"John" forKey:@"firstName"];
        Person* myPerson3 = [[[Person alloc] init] autorelease]; [myPerson3 setValue:@"George" forKey:@"firstName"];
        Person* myPerson4 = [[[Person alloc] init] autorelease]; [myPerson4 setValue:@"Ringo" forKey:@"firstName"];

        NSMutableArray* array = [NSMutableArray array];
        [array addObject:myPerson1];
        [array addObject:myPerson2];
        [array addObject:myPerson3];
        [array addObject:myPerson4];

        NSLog( @"Names %@", [array valueForKey:@"firstName"] );
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

        [self.guestTableView reloadData];


        NSInteger columnIndex = [
                self.guestTableView columnWithIdentifier:GBNameIdentifier];

        [self.guestTableView editColumn: columnIndex
                                    row: [self.guests indexOfObject:guest]
                              withEvent: nil
                                 select: YES
        ];
    }

    - (NSInteger) numberOfRowsInTableView:(NSTableView *)table {
        return self.guests.count;
    }

    -  (id)             tableView: (NSTableView *)table
        objectValueForTableColumn: (NSTableColumn *)column
                              row: (NSUInteger)row {
            NSDictionary* guest = [self.guests objectAtIndex:row];
            NSString* identifier = column.identifier;

            return [guest objectForKey:identifier];
    }

    - (void)     tableView: (NSTableView*)table
            setObjectValue: (id)object
            forTableColumn: (NSTableColumn*)column
                       row: (NSInteger)row {
            NSMutableDictionary* guest = [self.guests objectAtIndex:row];
            NSString* identifier = column.identifier;
            [guest setObject:object forKey:identifier];
     }

    // cocoa bindings is supported by three protocols: KVC KVO KVB (key value coding
    // key value observing, key value binding)

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
