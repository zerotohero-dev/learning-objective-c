#import "CBListView.h"
#import "CBMainWindow.h"
#import "CBPhoto.h"
#import "CBEditorView.h"

@implementation CBListView

@synthesize mainWindowController;
@synthesize imagesTable;
@synthesize imagesArrayController;


- (void) loadView {
 
    [super loadView];

    self.imagesTable.target       = self;
    self.imagesTable.doubleAction = @selector(tableViewItemDoubleClicked:);
    
}

- (IBAction) tableViewItemDoubleClicked:(id)sender {
    
    NSInteger row           = self.imagesTable.clickedRow;
    NSArray*  visiblePhotos = [self.imagesArrayController arrangedObjects];
    CBPhoto*  photo         = [visiblePhotos objectAtIndex:row];
    
    CBMainWindow* window = self.mainWindowController;
    id editor = [window viewControllerForName:@"CBEditorView"];
    
    if ( [editor isKindOfClass:[CBEditorView class]] )
        [(CBEditorView*)editor editPhoto:photo];
}

- (void) dealloc {
 
    self.imagesTable           = nil;
    self.imagesArrayController = nil;
    [super dealloc];
}

@end