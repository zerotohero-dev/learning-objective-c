/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

@interface O2AppDelegate : NSObject <NSApplicationDelegate>

// OUTLETS
    @property (assign) IBOutlet NSWindow*    window;
//check assign,retain
    @property (retain) IBOutlet NSTableView* guestTableView;

// DATA
    @property (retain) NSMutableArray*       guests;

// ACTION METHODS
    - (IBAction)signIn:(id)sender;
@end
