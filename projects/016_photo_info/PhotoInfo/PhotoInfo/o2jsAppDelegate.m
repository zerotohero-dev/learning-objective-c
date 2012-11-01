/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "o2jsAppDelegate.h"
#include "Photo.h"

@implementation o2jsAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    Photo* photo1 = [[Photo alloc] init];

    NSLog( @"photo1 caption: %@", photo1.caption );
    NSLog( @"photo1 photographer: %@", photo1.photographer );

    photo1.caption = @"Overlooking the Golden Gate Bridge";
    photo1.photographer = @"Volkan Özçelik";

    NSLog( @"photo1 caption: %@", photo1.caption );
    NSLog( @"photo1 photographer: %@", photo1.photographer );

    // Clean up your mess (this will call dealloc of Photo).
    [photo1 release];

    Photo* photo2 = [Photo photo];

    NSLog( @"photo2 caption: %@", photo2.caption );
    NSLog( @"photo2 photographer: %@", photo2.photographer );

    photo2.caption = @"Moffett Field"; photo2.photographer = @"Volkan Özçelik";

    NSLog( @"photo2 caption: %@", photo2.caption );
    NSLog( @"photo2 photographer: %@", photo2.photographer );

    // Releasing an auto-release object will result in an application crash!
    // [photo2 release];
}

@end
