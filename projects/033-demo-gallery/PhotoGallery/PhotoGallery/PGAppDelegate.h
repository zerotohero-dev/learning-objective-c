#import <Cocoa/Cocoa.h>

#import "PGMainWindow.h"
#import "PGAlbum.h"

@interface PGAppDelegate : NSObject <NSApplicationDelegate>

@property (retain) PGMainWindow* mainWindowController;
@property (retain) PGAlbum* selectedAlbum;


@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
