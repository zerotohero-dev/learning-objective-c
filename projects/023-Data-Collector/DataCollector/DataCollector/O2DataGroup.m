/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2DataGroup.h"
#import "NSRunningApplication-O2DataItem.h"

@interface O2DataGroup ()
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
