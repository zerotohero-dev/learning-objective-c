//
//  Photo.h
//  BasicObjects
//
//  Created by Volkan Ozcelik on 10/27/12.
//  Copyright (c) 2012 Volkan Ozcelik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject {
    NSString* caption;
    NSString* photographer;
}
- (NSString*) caption;
- (NSString*) photographer;
- (void) setCaption: (NSString*)input;
- (void) setPhotographer: (NSString*)input;
@end