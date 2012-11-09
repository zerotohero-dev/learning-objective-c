/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "Photo.h"

// Using categories for private methods.
@interface Photo (Private)
    + (NSString*) defaultCaption;
    - (void) logPhotographer;
@end

@implementation Photo
    @synthesize caption;
//    @synthesize photographer;

- (void) dealloc {
    [caption release];
    [photographer release];

    [super dealloc];
}

- (id) init {
    if (self = [super init]) {
        self.caption = [[self class] defaultCaption];
    }

    return self;
}

- (void) setPhotographer: (NSString*)input {
    [photographer autorelease];
    photographer = [input retain];

    [self logPhotographer];
}

// private methods.
+ (NSString*) defaultCaption {
    return @"Untitled Photo";
}
- (void) logPhotographer {
    NSLog(@"Photographer: %@", photographer);
}
@end