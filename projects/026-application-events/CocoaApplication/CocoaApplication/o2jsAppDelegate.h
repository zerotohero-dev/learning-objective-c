/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

@interface o2jsAppDelegate : NSObject <NSApplicationDelegate>
    // TODO: check
    @property (assign) IBOutlet NSWindow *window;
    @property (retain) IBOutlet NSTextField* mainTextField;
    @property (retain) IBOutlet NSTextField* sliderCompanionField;

    - (IBAction) buttonClicked:(id)sender;
    - (IBAction) imageFormatPopUpDidChange:(id)sender;
    - (IBAction) sliderDidChange:(id)sender;
    - (IBAction) textFieldDidChange:(id)sender;
    - (IBAction) populateTextField:(id)sender;
@end
