/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

@interface O2AppDelegate : NSObject <NSApplicationDelegate>

    @property (assign) IBOutlet NSWindow*    window;
    @property (retain) IBOutlet NSTableView* guestTableView;
    @property (retain) NSMutableArray*       guests;

    - (IBAction)signIn:(id)sender;
@end
