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