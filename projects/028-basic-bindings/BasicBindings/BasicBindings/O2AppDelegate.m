/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

// NSObjectController: Used to bind a view to a single object.
// NSArrayController: Used for binding views that display collections of objects.
// NSTreeController: Used for views that need to bind trees of objects.
// NSUserDefaultsController: Binds UI elements to application preferences.
// NSDictionaryController: binds key-value pair series to UI elements.

#import "O2AppDelegate.h"

NSString* const kDefaultTitle = @"New Image";
NSInteger const kDefaultScale = 50;

@implementation O2AppDelegate
    @synthesize window;
    @synthesize imageTitle;
    @synthesize imageScale;

    // startup and shutdown.
    - (void)applicationDidFinishLaunching:(NSNotification *)note {
        [self resetAllValues:self];
    }

    - (void) dealloc {
        self.imageTitle = nil;
        [super dealloc];
    }

    // accessors (only implemented for bindings testing).
    - (NSString *) imageTitle {
        NSLog( @"-imageTitle %@", imageTitle );
        return imageTitle;
    }
    - (void) setImageTitle:(NSString *)newTitle {
        NSLog( @"-setImageTitle: %@", newTitle );
        [imageTitle autorelease];
        imageTitle = [newTitle copy];
    }

    - (NSInteger) imageScale {
        NSLog( @"-imageScale %i", (int) imageScale);
        return imageScale;
    }

    - (void) setImageScale:(NSInteger)newScale {
        NSLog( @"-setImageScale: %i", (int) newScale);
        imageScale = newScale;
    }

    // action methods.
    - (IBAction) resetAllValues:(id)sender {
        self.imageTitle = kDefaultTitle;
        self.imageScale = kDefaultScale;
    }

@end