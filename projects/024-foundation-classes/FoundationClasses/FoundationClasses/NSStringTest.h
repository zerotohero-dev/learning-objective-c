/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>


@interface NSStringTest : NSObject
    // Instead of calling __attribute__ you can use a NSString here
    // and cast it to CFStringRef when required. (toll-free bridge).
    @property (retain) __attribute__((NSObject)) CFStringRef test;
    + (void) main;
@end