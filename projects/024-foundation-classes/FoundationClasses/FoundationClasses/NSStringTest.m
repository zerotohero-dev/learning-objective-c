/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */


#import "NSStringTest.h"


@implementation NSStringTest {

}

+ (void) main {
    NSString* myString = @"Lorem ipsum dolor sit";
    NSLog(@"Class of my string is %@", [myString className]);
    // will give NSCFString

    // Like all CF data types, NSCFString is "not" a class, it's an opaque struct.
    // you don't write code to directly access its fields, instead you use a series
    // of functions that are specifically designed for NSCFString.

    // CFSTR macro is the equivalent of objective C @"string" syntax.
    CFStringRef myString2 = CFSTR("Welcome to Core Foundation.");
    CFIndex length = CFStringGetLength(myString2);
    printf( "myString length: %ld\n", length );

    if ( CFStringHasPrefix( myString, CFSTR("Welcome") )) {
        printf( "myString starts with 'Welcome'\n" );
    }
}

- (void) foundationStringTest {
    NSString* myString = @"Welcome to Foundation.";
    NSInteger length = myString.length;

    NSLog( @"myString length: %ld", length );

    if ( [myString hasPrefix:@"Welcome"] ) {
        NSLog(@"myString starts with 'Welcome'" );
    }
}

void coreFoundationStringTest () {
    CFStringRef myString = CFSTR("Welcome to Core Foundation.");
    CFIndex length = CFStringGetLength ( myString );

    printf( "myString length: %ld\n", length );

    if ( CFStringHasPrefix( myString, CFSTR("Welcome") )) {
        printf( "myString starts with 'Welcome'\n" );
    }

    // these works similar to `alloc`.
    // CFStringCreateWithSubstring();
    // CFStringCreateCopy();
    // CFStringCreateWithFormatAndArguments();

    // instead of release we call CFRelease

    CFStringRef myString1 = CFSTR("Welcome to Core Foundation.");
    CFRange range = CFRangeMake( 0, 7 );
    CFTypeRef myString2;

    myString2 = (CFTypeRef) CFStringCreateWithSubstring( NULL, myString1, range );

    CFShow( myString2 );
    CFRelease( myString2 );

    // CFRange is a regular struct where you can access its fields freely.
    // CFStringRef is a pointer type like an objective C object.
    // typedef const struct __CFString * CFStringRef;
    // CFStringRef is a pointer to a private data struct.

    CFStringRef encodingName = CFStringGetNameOfEncoding( kCFStringEncodingUTF8 );
    CFRetain ( (CFTypeRef) encodingName );
    CFShow ( (CFTypeRef) encodingName );
    CFRelease ( (CFTypeRef) encodingName );

    // When you receive a Ref datatype from a function with "Create" or "Copy" in the name,
    // call CFRelease
    // When you receive a Ref datatype from a function with "Get" in the name, you should CFRetain
    // if you want it to stay around; and then CFRelease when you're done with it.

    // Core Foundation classes also have mutable variants, like the standard Objective C classes.

    // second argument is the maximum length of the string.
    CFMutableStringRef street = CFStringCreateMutable( NULL, 0 );
    CFStringAppend( street, CFSTR("W STIERLIN RD ") );
    CFStringAppend( street, CFSTR("APT 92 ") );
    CFStringAppend( street, CFSTR("SF, CA") );
    CFShow ( street );
    CFRelease ( street );

    // TOLL FREE BRIDGING

    // Anywhere you would use an NSString, you can use CFStringRef and vice versa.
    // One caveat is you have to cast the variable to the expected type to avoid compiler warnings.

    // using an NSMutableString as a CFMutableStringRef.
    NSMutableString* street2 = [[NSMutableString alloc] init];

    CFStringAppend( (CFMutableStringRef)street2, CFSTR("A ") );
    CFStringAppend( (CFMutableStringRef)street2, CFSTR("B ") );
    CFStringAppend( (CFMutableStringRef)street2, CFSTR("C ") );
    CFShow ( street2 );

    [street2 release];

    // using a CFMutableStringRef as an NSMutableString.
    // cast to separate variable for convenience.

    CFMutableStringRef colors = CFStringCreateMutable( NULL, 0 );

    NSMutableString* colorsObj = (NSMutableString*)colors;

    [colorsObj appendString:@"Red, "];
    [colorsObj appendString:@"Green, "];
    [colorsObj appendString:@"Blue."];

    NSLog( @"colors: %@", colors );

    CFRelease( colors );
}

NSString* stringObjectInFunction ( char* string ) {
    NSString* stringObject;
    stringObject = [NSString stringWithUTF8String:string];

    return stringObject;
}

void testStringObject () {
    NSString* country = stringObjectInFunction("Turkey");
    NSLog( @"country: %@", country );
}

// Core Foundation types are struct types but their memory is dynamically allocated
// and managed by retain/release scheme.
@end