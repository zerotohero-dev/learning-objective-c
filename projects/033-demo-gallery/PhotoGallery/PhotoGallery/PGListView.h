#import <Foundation/Foundation.h>
#import "PGMainWindow.h"

@interface PGListView : NSViewController
@property (assign) PGMainWindow* mainWindowController;
@property (retain) IBOutlet NSTableView* imagesTable;
@property (retain) IBOutlet NSArrayController* imagesArrayController;
- (IBAction) tableViewItemDoubleClicked:(id)sender;
@end
