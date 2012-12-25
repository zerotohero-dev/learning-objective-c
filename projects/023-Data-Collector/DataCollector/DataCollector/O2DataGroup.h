/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

// the protocol required by all items in a data group.
@protocol O2DataItem <NSObject>
    - (id) contents;
    - (NSString*) typeName;
    - (NSString*) title;

    @optional
    - (NSString*) author;
@end

// the main data group class.
@interface O2DataGroup : NSObject
    @property (copy)             NSString* name;
    @property (retain, readonly) NSMutableArray* items;
    @property (assign, readonly) int itemCount;

    + (id) runningApplicationsDataGroup;
    - (void) addItem:(id <O2DataItem>)newItem;
@end