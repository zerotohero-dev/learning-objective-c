/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "Photo.h"

@implementation Photo
- (id) init {
    if (self = [super init]) {
        [self setCaption:@"Default Caption"];
        [self setPhotographer:@"Default Photographer"];
    }
    
    return self;
}

- (NSString*) caption {
    return caption;
}
    
- (NSString*) photographer {
    return photographer;
}

- (void) setCaption: (NSString*)input {

    // caption and input might be the same object.
    // If that was true, and we were to -release the caption object,
    // it could immediately be freed and the next line of code
    // would crash the application. Using -autorelease guarantees
    // that the object will stay around at least
    // until the setter is done running.    
    [caption autorelease];
    [input retain];
    caption = input;
}

- (void) setPhotographer: (NSString*)input {
    [photographer autorelease];
    photographer = [input retain];
}

- (void) dealloc {

    // The goal of Objective-C memory management is to balance
    // every alloc or retain with either a release or autorelease.
    // We don't need to use autorelease here, and the standard
    // release is a bit faster.
    [caption release];
    [photographer release];

    // Or alternatively:
    [self setCaption:nil];
    [self setPhotographer:nil];
    
    [super dealloc];
}
@end


