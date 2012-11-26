/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */
 
#import "Dog.h"
#import "Cat.h"

@implementation Dog
- (void) woof {NSLog(@"woof %@", [self className]);}

- (NSMethodSignature*) methodSignatureForSelector:(SEL)selector {
    NSString* name = NSStringFromSelector(selector);

    NSLog( @"-[%@: methodSignatureForSelector: %@]", [self className], name );

    if ([Cat instancesRespondToSelector:selector]) {
        return [Cat instanceMethodSignatureForSelector:selector];
    }

    //return [self methodSignatureForSelector:selector];
    return [super methodSignatureForSelector:selector];
}

- (void) forwardInvocation: (NSInvocation*) invocation {
    NSString* name = NSStringFromSelector( invocation.selector );

    NSLog( @"-[%@: forwardInvocation: %@]", [self className], name );

    id theCat = [[Cat alloc] init];

    NSLog( @"Forwarding '%@' to %@", name, theCat );

    [invocation invokeWithTarget: theCat];

    [theCat release];
}
@end
