/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[]) {
    return NSApplicationMain(argc, (const char **)argv);

    // Insert code here to initialize your application
    NSLog(@"Hello, World!");

    id url   = [NSURL URLWithString:@"http://o2js.com/images/o2logo.tiff"];
    id image = [[NSImage alloc] initWithContentsOfURL:url];
    id tiff  = [image TIFFRepresentation];

    [tiff writeToFile:@"/Users/volkan.ozcelik/test.tiff" atomically:YES];
}
