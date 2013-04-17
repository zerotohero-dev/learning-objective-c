#import <Cocoa/Cocoa.h>

@class CBMainWindow;

@interface CBListView : NSViewController

@property (assign) CBMainWindow* mainWindowController;
@property (retain) IBOutlet NSTableView* imagesTable;
@property (retain) IBOutlet NSArrayController* imagesArrayController;

- (IBAction) tableViewItemDoubleClicked:(id)sender;

@end