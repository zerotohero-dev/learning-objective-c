/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

// Include category name in the file name for ease of "categorization".
#import "NSString-Utilities.h"

@implementation NSString (Utilities)
- (BOOL) isURL {
    if ([self hasPrefix:@"http://"]) {
        return YES;
    }

    return NO;
}

// You can use categories to replace the existing methods of a class too.

// if two categories override the same method, it's not guaranteed which
// will take precedence. 
@end
