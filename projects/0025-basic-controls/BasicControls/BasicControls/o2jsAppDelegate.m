/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "o2jsAppDelegate.h"

@implementation o2jsAppDelegate

- (void)dealloc {
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Builtin Controls
    // Customization of Builtin Controls
    // New Controls from Scratch

    // NSWindow contains NSView
    // A view draws itself into the window, receives input, and then draws it again.

    // NSWindow -> NSResponder (for support for keyboard mouse and multitouch events)
    // NSView -> NSResponder
    // NSResponder -> NSObject

    // Cocoa is an "event-based" framework. The view is notified when something happens.

    // for iPhone, iPad, and iPod the inheritance is like this:
    // UIResponder <- UIView <- UIWindow

    // NSControl -is a-> NSView
    // NSControl -has a-> NSCell

    // for iPhone's UIKit we have UITableViewCell instead.

    // Targets and Actions

    // An action is basically a selector (or a placeholder for a method)

    // NSButton
}

@end
