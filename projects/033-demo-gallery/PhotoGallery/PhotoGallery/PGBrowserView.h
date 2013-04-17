#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>
#import "PGMainWindow.h"

@interface PGBrowserView : NSViewController <NSTableViewDelegate>

// parent window.
@property (assign) PGMainWindow* mainWindowController;

// xib items.
@property (retain) IBOutlet IKImageBrowserView* imageBrowser;
@property (retain) IBOutlet NSTableView* albumsTable;
@property (retain) IBOutlet NSArrayController* albumsArrayController;
@property (retain) IBOutlet NSArrayController* imagesArrayController;

// additional values.
@property (retain) NSArray* imagesSortDescriptors;

@property (assign) CGFloat thumbnailScale;

@end
