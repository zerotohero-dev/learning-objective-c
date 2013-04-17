#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>
#import "PGMainWindow.h"
#import "PGPhoto.h"

@interface PGEditorView : NSViewController
@property (assign) PGMainWindow* mainWindowController;
@property (retain) IBOutlet IKImageView* imageView;
- (void)editPhoto:(PGPhoto *)photo;
@end