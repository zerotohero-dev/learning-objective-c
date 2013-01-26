/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>


@interface O2User : NSObject
    //TODO: use a property instead.
    - (void) setSecret: (NSString*)input;
    + (O2User*) guestUser;
    + (O2User*) adminUser;
@end