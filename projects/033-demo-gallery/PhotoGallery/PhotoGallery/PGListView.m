#import "PGListView.h"
#import "PGPhoto.h"
#import "PGEditorView.h"

@implementation PGListView
@synthesize mainWindowController;
@synthesize imagesTable;
@synthesize imagesArrayController;

- (void) loadView {
    [super loadView];
    self.imagesTable.target = self;
    self.imagesTable.doubleAction = @selector(tableViewItemDoubleClicked:);
}

- (IBAction) tableViewItemDoubleClicked:(id)sender {
    NSInteger row = self.imagesTable.clickedRow;
    NSArray* visiblePhotos = [self.imagesArrayController arrangedObjects];

    PGPhoto* photo = [visiblePhotos objectAtIndex:row];
    PGMainWindow* window = self.mainWindowController;

    id editor = [window viewControllerForName:@"PGEditorView"];

    if ( [editor isKindOfClass:[PGEditorView class]] ) {
        [(PGEditorView*)editor editPhoto:photo];
    }
}

/*
NSManagedObjectContext* context = self.managedObjectContext;
NSManagedObject* photo;
photo = [NSEntityDescription insertNewObjectForEntityForName: @"Photo"
inManagedObjectContext: context];
[photo setValue: @"/Library/Desktop Pictures/Nature/Earth.jpg" forKey: @"filePath"];
NSLog( @"photo filePath: %@", [photo valueForKey:@"filePath"] );
 */

- (void) dealloc {
    //TODO: why nil but not release.
    self.imagesTable = nil;
    self.imagesArrayController = nil;

    [super dealloc];
}
@end
