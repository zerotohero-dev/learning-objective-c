#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@class CBMainWindow;
@class CBPhoto;

@interface CBEditorView : NSViewController

@property (assign) CBMainWindow* mainWindowController;
@property (retain) IBOutlet IKImageView* imageView;

- (void) editPhoto: (CBPhoto*)photo;

@end