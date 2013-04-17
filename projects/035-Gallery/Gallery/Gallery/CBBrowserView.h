#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@class CBMainWindow;

@interface CBBrowserView : NSViewController <NSTableViewDelegate>

// parent window.
@property (assign) CBMainWindow* mainWindowController;

// xib items.
@property (retain) IBOutlet IKImageBrowserView* imageBrowser;
@property (retain) IBOutlet NSTableView*        albumsTable;
@property (retain) IBOutlet NSArrayController*  albumsArrayController;
@property (retain) IBOutlet NSArrayController*  imagesArrayController;

// additional values.
@property (retain) NSArray* imagesSortDescriptors;
@property (assign) CGFloat  thumbnailScale;

@end