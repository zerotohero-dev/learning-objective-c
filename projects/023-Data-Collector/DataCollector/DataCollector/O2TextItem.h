/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>
#import "O2DataGroup.h"

@interface O2TextItem : NSObject <O2DataItem>
    @property (copy)           NSString* contents;
    @property (copy, readonly) NSString* typeName;
    @property (copy)           NSString* title;
    @property (copy)           NSString* author;
@end
