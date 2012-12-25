/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "NSRunningApplication-O2DataItem.h"

@implementation NSRunningApplication (O2DataMethods)

    - (id) contents {
        return self.bundleURL;
    }

    - (NSString*) typeName {
        return @"Application";
    }

    - (NSString*) title {
       return self.localizedName;
    }

    - (NSString*) description {
        return [NSString stringWithFormat:@"%@: %@", self.title, self.contents];
    }
@end
