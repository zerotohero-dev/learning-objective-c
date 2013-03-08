#import <Cocoa/Cocoa.h>
@interface O2AppDelegate : NSObject <NSApplicationDelegate>
    @property (assign) IBOutlet NSWindow *window;
    @property (copy) NSString* imageTitle;
    @property (assign) NSInteger imageScale;

    - (IBAction) resetAllValues:(id)sender;
@end