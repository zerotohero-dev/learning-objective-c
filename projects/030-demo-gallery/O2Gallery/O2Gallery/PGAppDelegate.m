
//NSWindowController
//- (id) initWithWindowNibName: (NSString *)windowNibName;
    // initializes the window and loads the contents of the names xib file.
//- (void) loadWindow;
    // actually loads the window and initializes it. call [super loadWindow] if you override it.
//- (NSWindow *) window;
    // gets the current window reference.
//- (IBAction) showWindow: (id)sender;
    // displays the window on the screen.

#import "PGAppDelegate.h"
#import "CustomWindowController.h"

@implementation PGAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    CustomWindowController* controller;
    controller = [[CustomWindowController alloc] initWithWindowNibName:@"Window"];

    [controller showWindow:self];

    // When a windowcontroller is deallocated, it also releases other items in the xib.
}

// window -> windowcontroller -> window xib file -> {many view xib files and view controllers}

@end

//NSViewController
    // - (id)initWithNibName:(NSString *)name bundle:(NSBundle *)bundle;
    // - (void) loadView; - (NSView *) view;
    // - (void)setTitle:(NSString *)title;
    // - (NSString *)title;
    // - (void)setRepresentedObject:(id)object;
        // property to refer to another object that the view describes (generally a Model)
    // - (id)representedObject;

// Core Data
// Core Data classes offer change tracking, that is: they are aware of the additions and deletions you make to them.

// NSManagedObjectModel

// NSEntityDescription (belongs to NSManagedObjectModel)
// owns NSAttributeDescription and NSRelationshipDescription

// NSManagedObject -- linked to an NSEntityDescription
// holds onto values unless application saves the data to disk
//

// NSManagedObjectContext -- manages NSMangedObject instances.
// tracks changes etc, when you need to load or save data, you'll need this

// NSPersistentStoreCoordinator -- cora data saves its data to persistent stores.