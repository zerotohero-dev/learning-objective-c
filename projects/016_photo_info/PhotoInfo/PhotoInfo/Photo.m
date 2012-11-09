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
+ (Photo*) photo {
    Photo* newPhoto = [[Photo alloc] init];
    return [newPhoto autorelease];
}

// The NSZone class indicates a memory zone.
// The idea is to keep related objects close together in memory
// to increase performance.
// You'll rarely see this in methods other than copyWithZone
- (id) copyWithZone:(NSZone *)zone {
    Photo* newPhoto = [[Photo allocWithZone:zone] init];
    newPhoto.caption = self.caption;
    newPhoto.photographer = self.photographer;

    return newPhoto;
}
- (NSString*) caption {
    return caption;
}
- (NSString*) photographer {
    return photographer;
}
- (void) setCaption: (NSString*)input {
    [caption autorelease];
    caption = [input retain];
}
- (void) setPhotographer: (NSString*)input {
    [photographer autorelease];
    photographer = [input retain];
}
- (void) dealloc {
    NSLog(@"Calling dealloc on photo ");

    [self setCaption:nil];
    [self setPhotographer:nil];
    [super dealloc];
}
@end
