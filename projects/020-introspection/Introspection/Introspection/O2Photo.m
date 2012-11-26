/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2Photo.h"

@implementation O2Photo

@synthesize caption;
@synthesize photographer;
@synthesize name;

+ (O2Photo*) photo {
    O2Photo* newPhoto = [[O2Photo alloc] init];

    return [newPhoto autorelease];
}

- (id) init {
    if (self = [super init]) {
        [self setCaption:@"Default Caption"];
        [self setPhotographer:@"Default Photographer"];
    }

    return self;
}

- (void) dealloc {
    self.caption      = nil;
    self.photographer = nil;
    self.name         = nil;

    [super dealloc];
}

// Privates

+ (NSString*) defaultCaption {
    return @"Untitled Photo";
}

- (void) logPhotographer {
    NSLog(@"Phtoographer: %@", photographer);
}

@end
