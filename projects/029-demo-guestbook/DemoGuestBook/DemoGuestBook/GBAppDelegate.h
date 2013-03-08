/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

@interface GBAppDelegate : NSObject <NSApplicationDelegate>

// TODO: create a separate class that implements data source methods
// and bind the table view's data source to that class instead.

// outlets.
@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet NSTableView* guestsTableView;

// data.
@property (retain) NSMutableArray* guests;

// action methods.
- (IBAction)signIn:(id)sender;

@end
