/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>


/* 
 * This won't work.
 * Local Strings go away when the function ends.
 */
//char[] myFunction() {
//    char theString[] = "Hello";
//
//    return theString;
//}

/*
 * You can return strings created with asprintf,
 * because data is assigned with malloc, and it won't
 * go away until you free it.
 */
char* myFunction() {
    char* greet;
    
    asprintf(&greet, "Hello");
    
    return greet;
}

int main(int argc, const char * argv[]){

    // insert code here...
    NSLog(@"Hello, World!");
    
    return 0;
}

