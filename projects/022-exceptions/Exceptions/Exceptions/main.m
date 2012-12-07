/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */
 
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");

        NSString* myString = [[NSString alloc] init];

        @try {
            char firstChar = [myString characterAtIndex:0];
            int  length    = [myString length];

            NSLog(@"Length is %i", length);
        }
        @catch (NSException *exception) {
            NSLog(@"Caught NSException. Returning.");
            NSLog(@"Name: %@", exception.name);
            NSLog(@"Reason: %@", exception.reason);

            return -1;
        }
        @finally {
            NSLog(@"Releasing the String.");
            [myString release];
        }

    }
    
    return 0;
}

