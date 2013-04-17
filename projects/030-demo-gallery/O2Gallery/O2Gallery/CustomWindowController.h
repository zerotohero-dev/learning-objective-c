#import <Foundation/Foundation.h>

@interface CustomWindowController : NSWindowController
    @property (retain) IBOutlet NSSlider* slider;
    @property (retain) IBOutlet NSTextField* textField;

    - (IBAction) sliderDidChange:(id)sender;
    - (IBAction) textDidChange:(id)sender;
@end