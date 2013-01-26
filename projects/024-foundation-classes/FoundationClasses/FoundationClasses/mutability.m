/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#include "mutability.h"
#import "O2User.h"

void test() {
    // pointer to constant char. you cannot use this pointer to change the value that's being pointed to.
    const char * myPtr;

    // Constant pointer to char. where the pointer points cannot change.
    char * const myPtr2;

    // Constant pointer to constant char. Neither what the pointer points to, nor the pointed value can change.
    const char * const myPtr3;

    // http://www.codeguru.com/cpp/cpp/cpp_mfc/general/article.php/c6967/Constant-Pointers-and-Pointers-to-Constants.htm

    NSMutableString* name = [@"Volkan" mutableCopy];

    NSMutableString* name1 = [NSMutableString stringWithString:@"Volkan"];
    NSMutableString *name2;
    name2 = [[NSMutableString alloc] initWithString:@"Stargazer"];

    [name2 release];
    [name release];

    // Creating objects always take time and CPU power.
    // and mutable objects can come handy.
    // That's important in especially mobile devices.

    // slower to create 1000 separate strings.
    NSUInteger count = 1000;
    NSString* total1 = [NSString string];

    for (NSInteger i = 0; i < count; i++) {
        total1 = [total1 stringByAppendingFormat:@"%ld", i];
    }

    // faster to add a single mutable string.
    NSMutableString* total2 = [NSMutableString string];

    for ( NSInteger i = 0; i < count; i++ ) {
        [total2 appendFormat:@"%ld", i];
    }

    // As per the advantages of immutability, compiler has certain optimizations on them
    // Like two identical immutable Strings live in the same location to save memory.

    NSString* firstString = @"Palo Alto";
    NSString* secondString = [firstString copy];
    NSLog (@"firstString address: %p", (void *) firstString);
    NSLog (@"secondString address: %p", (void *) secondString);

    [secondString release];

    // The other advantage is security.

    O2User* guest = [O2User guestUser];
    O2User* admin = [O2User adminUser];

    NSMutableString* credentials = [NSMutableString string];

    [credentials setString:@"guest-credentials"];
    [guest setSecret:credentials];

    [credentials setString:@"admin-credentials"];
    [admin setSecret:credentials];

    // Since credentials is mutable, guest and admin are using the same copy.
    // It is very likely that now guest can access admin credentials.
    // To avoid this we can use the `copy` option in the property declaration.
    // This generates a setter method that calls `copy` methods on the objects
    // that are passed in.
}