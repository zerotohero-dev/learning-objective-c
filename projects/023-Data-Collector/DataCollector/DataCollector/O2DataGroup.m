/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2DataGroup.h"
#import "NSRunningApplication-O2DataItem.h"

@interface O2DataGroup (Private)

    // privately redefine properties as writable.
    @property (retain, readwrite) NSMutableArray* items;

    // private methods.
    + (NSString*) defaultName;
@end

@implementation O2DataGroup
    @synthesize name;
    @synthesize items;

    - (id) init {
        if ( self = [super init] ) {
            self.name = [[self class] defaultName];
            self.items = [NSMutableArray array];
        }

        return self;
    }

    - (void) dealloc {
        self.name = nil;
        self.items = nil;

        [super dealloc];
    }

    - (int) itemCount {
        return self.items.count;
    }

    - (void) addItem:(id<O2DataItem>)newItem {
        [self.items addObject:newItem];
    }

    - (NSString*) description {
        return [NSString stringWithFormat:
            @" Data Group %@: %@", self.name, self.items];
    }

    + (NSString*) defaultName {
        return @"Untitled Group";
    }

    + (id) runningApplicationsDataGroup {
        O2DataGroup* newDataGroup = [[O2DataGroup alloc] init];
        newDataGroup.name = @"Application Items";

        // Get all running applications
        NSWorkspace* ws = [NSWorkspace sharedWorkspace];
        NSArray* apps   = [ws runningApplications];

        for (int i = 0; i < apps.count; i++) {
            NSRunningApplication* app = [apps objectAtIndex:i];

            [newDataGroup addItem:app];
        }

        return [newDataGroup autorelease];
    }
@end