/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */


#import "O2User.h"


@implementation O2User
- (void) setSecret: (NSString*)input {

}

+ (O2User*) guestUser {
    // TODO: how about using an attribute instead?
    return [[[O2User alloc] init] autorelease];
}

+ (O2User*) adminUser {
    return [[[O2User alloc] init] autorelease];
}
@end