/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "o2jsAppDelegate.h"

@implementation o2jsAppDelegate

@synthesize mainTextField;
@synthesize sliderCompanionField;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
NSRect frame = NSMakeRect(10, 40, 90, 40);
NSButton* pushButton = [[NSButton alloc] initWithFrame: frame]; pushButton.bezelStyle = NSRoundedBezelStyle; [self.window.contentView addSubview:pushButton];
pushButton.target = self;
pushButton.action = @selector(reloadDocument:);
[pushButton performClick:self];
[pushButton release];

NSMenuItem* menuItem = [[NSMenuItem alloc] init];
menuItem.title = @"Copy";
// setting nil sends the action to the responder chain.
menuItem.target = nil;
menuItem.action = @selector(copy:);

[menuItem release];
}

- (void)testResponderChain{
    NSMenuItem* menuItem = [[NSMenuItem alloc] init];
    menuItem.title = @"Save"; menuItem.action = @selector(save:);

    // INCORRECT. does not use the responder chain.
    // We should set it to nill instead, or the action of the menuItem will
    // always go to that object, since we're assigning by ref here.
    menuItem.target = self.window.firstResponder;

    // This is the correct one; now we're using the responder chain.
    menuItem.target = nil;

    // All objects in the responder chain inherit from NSResponder.

    // [NSWindow firstReponder] returns the current object that has focus.
    // usually an NSView, NSControl, or NSWindow.

    // The "first responder" object in the interface builder enables you to
    // send actions to objects in the responder chain.

    // the contentView property is the root of a window.
    // all the views are in contenView or in one of its subViews.

    [menuItem release];

    NSWindow* myWindow = [[NSWindow alloc] init];
    NSButton* myButton = [[NSButton alloc] init];

    [myWindow.contentView addSubview:myButton];

    [myButton release];

    NSLog (@"firstResponder: %@", myWindow.firstResponder);

    [myWindow makeFirstResponder:myButton];

    NSLog (@"firstResponder: %@", myWindow.firstResponder);

    [myWindow makeFirstResponder:nil];

    NSLog (@"firstResponder: %@", myWindow.firstResponder);

    [myWindow release];

    // the first responder of a window is the NSWindow object itself.

    // setting firstresponder to nill will commit any pendingchanges in a text
    // field, so it's important to do this before saving things, or before
    // switching panels.
}

// NSPopupButton, although acts differently, is a subclass of NSButton.
- (IBAction) imageFormatPopUpDidChange: (id)sender {
    NSLog( @"selected item: %@", [sender selectedItem] );

    NSLog( @"selected index: %i", (int) [sender indexOfSelectedItem] );
    NSLog( @"selected title: %@", [sender titleOfSelectedItem] );
}

- (IBAction) sliderDidChange:(id)sender {
    NSLog( @"sender: %@", sender );
    NSLog( @"sender value: %2.2f%%", [sender floatValue] );

    CGFloat amount = (CGFloat) [sender floatValue];

    self.sliderCompanionField.floatValue = amount;
}

- (IBAction) textFieldDidChange:(id)sender {
    NSLog( @"sender: %@", sender );
    NSLog( @"sender text: %@", [sender stringValue] );
}

- (void) testPopupButtonCode{
    NSRect frame = NSMakeRect(10, 40, 120, 40);
    NSPopUpButton* popUpButton = [[NSPopUpButton alloc] initWithFrame:frame];

    [self.window.contentView addSubview:popUpButton];

    [popUpButton addItemWithTitle: @"PNG"];
    [popUpButton addItemWithTitle: @"JPEG"];
    [popUpButton addItemWithTitle: @"PDF"];
    [popUpButton addItemWithTitle: @"TIFF"];

    NSLog(@"popUpButton itemArray: %@", popUpButton.itemArray);
    NSLog(@"popUpButton itemTitles: %@", popUpButton.itemTitles);

    [popUpButton removeItemWithTitle: @"JPEG"];

    NSLog(@"popUpButton itemTitles: %@", popUpButton.itemTitles);

    [[popUpButton itemWithTitle: @"TIFF"] setTitle:@"M4V"];

    NSLog(@"popUpButton itemTitles: %@", popUpButton.itemTitles);

    [popUpButton removeAllItems];

    NSLog(@"popUpButton itemTitles: %@", popUpButton.itemTitles);

    [popUpButton release];
}







- (IBAction) populateTextField:(id)sender {
NSDateFormatter* formatter = [[NSDateFormatter alloc] init]; [formatter setDoesRelativeDateFormatting: YES];
[formatter setDateStyle: NSDateFormatterLongStyle]; [formatter setTimeStyle: NSDateFormatterShortStyle];
NSDate* now = [NSDate date];
NSString* formattedDate = [formatter stringFromDate:now]; self.mainTextField.stringValue = formattedDate;
[formatter release]; }




















- (IBAction) reloadDocument: (id)sender {
NSLog( @"Calling -reloadDocument: with sender: %@", sender );
}

- (IBAction) buttonClicked:(id)sender {
    NSLog( @"Please do not press this button again." );
}

@end
