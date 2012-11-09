/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>
#import "NSString-Utilities.h"

int main(int argc, const char * argv[]) {

    NSString* string1 = @"hello world";

    if ([string1 isUrl]) {
        NSLog(@"is url");
    }

    return 0;
}

