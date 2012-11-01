//
//  Photo.m
//  PhotoInfo
//
//  Created by Volkan Ozcelik on 11/1/12.
//  Copyright (c) 2012 Volkan Ozcelik. All rights reserved.
//

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
