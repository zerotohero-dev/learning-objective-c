/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */
#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[]){
    // These two are the same:
    NSString* string1 = [NSString string];
    NSString* string2 = [[[NSString alloc] init] autorelease];
    
    // Auto released:
    NSString* myString = [NSString string];
    
    // manually allocated (needs explicit release).
    NSString* myString2 = [[NSString alloc] init];

    NSNumber* value = [[NSNumber alloc] initWithFloat:1.0];
    
    // If you’re writing an application for Mac OS X, you have
    // the option to enable garbage collection, which means that
    // you generally don’t have to think about memory management
    // until you get to more complex cases.
    // However, that’s not always an option.
    // For example, the iPhone SDK does not support garbage collection
    
    [value release];
    //[myString release];
    [myString2 release];
    
    // You might be tempted to manually release an autoreleased object
    // just to be sure that it's been cleaned up,
    // but doing that will cause a crash.
    
    return NSApplicationMain(argc, (const char **)argv);
}
