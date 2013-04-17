#import <Cocoa/Cocoa.h>

@class CBMainWindow;
@class CBAlbum;

@interface Gallery_AppDelegate : NSObject

@property (retain) CBMainWindow* mainWindowController;
@property (retain) CBAlbum*      selectedAlbum;

- (IBAction) newAlbum: (id)sender;


// provided by template.
@property (nonatomic, retain) IBOutlet NSWindow *window;

@property (nonatomic, retain, readonly)
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly)
    NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly)
    NSManagedObjectContext *managedObjectContext;
- (IBAction)saveAction:sender;

@end