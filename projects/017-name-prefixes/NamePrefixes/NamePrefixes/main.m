/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // Objective C does not implement namespaces, which means all the class
    // names and global variables are in the same global pool.

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }

    return 0;
}

