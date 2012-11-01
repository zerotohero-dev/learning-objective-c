//
//  Photo.h
//  PhotoInfo
//
//  Created by Volkan Ozcelik on 11/1/12.
//  Copyright (c) 2012 Volkan Ozcelik. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface Photo : NSObject {
    NSString* caption;
    NSString* photographer;
}
+ (Photo*) photo;
- (NSString*) caption;
- (NSString*) photographer;
- (void) setCaption: (NSString*)input;
- (void) setPhotographer: (NSString*)input;
@end