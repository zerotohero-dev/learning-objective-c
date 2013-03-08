#import "Person.h"

@implementation Person
    @synthesize firstName;
    @synthesize lastName;

    - (NSString*) firstName {
        NSLog( @"calling -firstName");
        return firstName;
    }

    - (void) setFirstName:(NSString*)newName {
        NSLog(@"calling -setFirstName:");
        [firstName autorelease];
        firstName = [newName copy];
    }

    - (NSString*) lastName {
        NSLog( @"calling -lastName");
        return lastName;
    }

    - (void) setLastName:(NSString *)newName {
        NSLog(@"calling -setLastName:");
        [lastName autorelease];
        lastName = [newName copy];
    }

    - (void) dealloc {
        [firstName release];
        [lastName release];
        [super dealloc];
    }
@end