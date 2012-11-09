/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

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