/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>
#import "O2DataGroup.h"

@interface NSRunningApplication (O2DataItemMethods) <O2DataItem>
    - (id) contents;
    - (NSString *) typeName;
    - (NSString *) title;
@end