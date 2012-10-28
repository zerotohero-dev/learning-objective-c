/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[]) {
    
    NSWindow* myWindow = [[NSWindow alloc] init];
    [myWindow setFrame:NSMakeRect(100, 100, 400, 300) display:YES];
    [myWindow orderFront:nil];
    
    myWindow.title = @"Hello World";
    
    return NSApplicationMain(argc, (const char **)argv);
}
