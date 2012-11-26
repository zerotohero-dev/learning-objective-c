/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>

@interface O2Photo : NSObject {}

+ (O2Photo*) photo;

@property (retain, nonatomic) NSString* name;
@property (retain, nonatomic) NSString* caption;
@property (retain, nonatomic) NSString* photographer;

@end

@interface O2Photo (Private) {}

+ (NSString*) defaultCaption;

- (void) logPhotographer;

@end