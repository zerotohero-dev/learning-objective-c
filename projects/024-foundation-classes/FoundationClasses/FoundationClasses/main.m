/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>
#import "O2User.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // combining two strings.
        NSString* firstName = @"Albert ";
        NSString* lastName = @"Einstein";
        NSString* fullName = [firstName
            stringByAppendingString:lastName];

        NSLog( @"fullName: %@", fullName );

        // combining more than two strings.
        NSString* sentence = @"Welcome ";
        sentence = [sentence stringByAppendingString:@"to the "];
        sentence = [sentence stringByAppendingString:@"future."];

        NSLog( @"sentence: %@", sentence );

        NSString* first  = @"Monday";
        NSString* second = @"Tuesday";
        NSString* third  = @"Wednesday";

        // INCORRECT. this is a memory leak!
        // calling -release only once for three
        // +alloc calls!
        NSString* dayOfWeek1 = nil;

        dayOfWeek1 = [[NSString alloc] initWithString:first];
        dayOfWeek1 = [[NSString alloc] initWithString:second];
        dayOfWeek1 = [[NSString alloc] initWithString:third];

        [dayOfWeek1 release];

        // BETTER: doesn't leak, but bad style.
        NSString* dayOfWeek2 = nil;

        dayOfWeek2 = [[[NSString alloc] initWithString:first] autorelease];
        dayOfWeek2 = [[[NSString alloc] initWithString:second] autorelease];
        dayOfWeek2 = [[[NSString alloc] initWithString:third] autorelease];

        // BEST: when reusing a variable, use a class method
        // with built-in autorelease.
        NSString* dayOfWeek3 = nil;

        dayOfWeek3 = [NSString stringWithString:first];
        dayOfWeek3 = [NSString stringWithString:second];
        dayOfWeek3 = [NSString stringWithString:third];

//        +stringByAppendingString, -initWithString, and +stringWithString all
//        autorelease and copy the String, so you don't have to call -copy manually.

//            +stringWithFormat:
//                Creates a string using NSLog() formatting
//            -length
//                Returns the length of the string
//            -characterAtIndex:
//                Returns the single character at a specific point in the string
//            -hasPrefix:
//                Returns YES if the string starts with a specific prefix
//            -intValue
//                Returns an int version of the string contents (for example, @"12abc" would result in the integer value 12)
//            -UTF8String
//                Returns a char pointer version of the string for use with C functions
//            -substringFromIndex:
//                Returns a substring with all of the characters between a starting point and the end
//            -substringWithRange:
//                Returns a substring     with a specific starting point and length
//            -rangeOfSubstring:
//                Searches for the starting point and length of a substring

        NSString* fullName2 = @"Albert Einstein";
        NSRange   myRange  = NSMakeRange(0, 6);

        NSString* firstName2 = [fullName2 substringWithRange: myRange];

        NSLog(@"%@", firstName2);

        NSString* header     = @"Last Name: Einstein";
        NSRange   fieldRange = [header rangeOfString:@"LastName: "];

        if (fieldRange.length > 0) {
            int start = (int) fieldRange.location;
            int count = (int) fieldRange.length;

            int startOfName = start + count;

            NSString* lastName3 = [header substringFromIndex: startOfName];

            NSLog(@"lastName: %@", lastName3);
        }

        // NSString with C Types

        NSString* totalString       = @"10"; 
        NSString* goldenRatioString = @"1.618"; 
        NSString* cityName          = @"Mountain View";

        int total                   = [totalString intValue];
        float goldenRatio           = [goldenRatioString floatValue]; 
        const char* cityNameCString = [cityName UTF8String];

        int   count    = 100;
        float piValue  = 3.1415926;
        char* starName = "Vega";

        NSString* countString    = [NSString stringWithFormat:@"%i",count];
        NSString* piString       = [NSString stringWithFormat:@"%f", piValue];
        NSString* starNameString = [NSString stringWithUTF8String:starName];

        // Strings are Object Types
        NSString* firstString  = [NSString stringWithFormat:@"%i", 10000];
        NSString* secondString = [NSString stringWithFormat:@"%i", 10000];

        if ([firstString isEqualToString:secondString]) {
            NSLog (@"The strings are the same");
        } else {
            NSLog (@"The strings are not the same");
        }

        // Compiler is clever enough to give the same memory address to identical
        // (constant) strings. Since strings are immutable you won't see any
        // practical change in how your apps work.
        // BOTTOM line: use isEqualToString for comparision.

        NSString* firstCity = @"Cupertino"; 
        NSString* secondCity = @"Cupertino";

        if ( firstCity == secondCity ) {
            NSLog(@"The cities are the same");
        } else {
            NSLog(@"The cities are not the same"); 
        }

        NSLog(@"firstCity string: '%@' pointer: %p", firstCity, firstCity);
        NSLog(@"secondCity string: '%@' pointer: %p", secondCity, secondCity);

        // Strings as File Paths

        // -lastPathComponent
        // Returns the last part of a path, such as a filename

        // -pathExtension
        // Returns the file extension of the last part of the path, such as .txt

        // -stringByExpandingTildeInPath
        // Returns a copy with a Unix-style ~username path fully resolved

        // -stringByDeletingLastPathComponent
        // Returns a copy with the last path item removed, such as the filename

        // -stringByDeletingPathExtension
        // Returns a copy with just the file extension removed, such as .html

        // -stringByAppendingPathComponent
        // Returns a copy with an additional path item (you could use
        // this to add a filename to a folder path, for example)

        // -stringByResolvingSymlinksInPath
        // Returns a copy with any symbolic links fully resolved
        // (does not work with aliases created by the
        // Finder’s File > Make Alias command)

        // -isAbsolutePathDescription
        // Returns YES if the path is referenced from the top of the
        // filesystem (such as /Developer/Applications/Xcode.app

        NSString* pathToApp    = @"/Applications/Safari.app"; 
        NSString* fullFileName = [pathToApp lastPathComponent]; 
        NSString* fileName     = [fullFileName stringByDeletingPathExtension];

        if ([pathToApp isAbsolutePath]) {
            NSLog(@"The application's path is absolute."); 
        }

        NSLog(@"pathToApp: %@", pathToApp); 
        NSLog(@"fullFileName: %@", fullFileName); 
        NSLog(@"fileName: %@", fileName);

        NSLog(@"My user name is: %@",      NSUserName()); 
        NSLog(@"My full name is: %@",      NSFullUserName()); 
        NSLog(@"My home directory is: %@", NSHomeDirectory());

        // Read/Write Files

        NSString* lastLine2 = @"Beauty is truth, truth beauty";
        NSString* fileName2 = @"GrecianUrn.txt";
        NSString* homeDir2  = NSHomeDirectory();
        NSString* fullPath2 = [homeDir2 stringByAppendingPathComponent:fileName2];

        // atomically: write to a temp file before moving it to the location.
        [lastLine2 writeToFile:fullPath2 atomically:NO];

        NSString* lastLine3 = @"Beauty is truth, truth beauty";
        NSString* fileName3 = @"GrecianUrn.txt";
        NSString* homeDir3  = NSHomeDirectory();
        NSString* fullPath3 = [homeDir3 stringByAppendingPathComponent:fileName3];

        NSError* error = nil;

        [lastLine3 writeToFile:fullPath3 atomically:NO
            encoding:NSASCIIStringEncoding error:&error];

        if (error != nil) {
            // Although it looks like a class, `NSApp` is reference to the
            // NSApplication singleton in each program. It allows you to
            // perform application-wide tasks such as finding the frontmost
            // window, or changing the dock icon.

            //[NSApp presentError:error];

            NSLog(@"Error: %@", error);
        }

        // Reading from files

        NSString* fileName4 = @"GrecianUrn.txt";
        NSString* homeDir4  = NSHomeDirectory();
        NSString* fullPath4 = [homeDir4 stringByAppendingPathComponent:fileName4];
        NSError* error4     = nil;

        NSStringEncoding encoding;

        // Aligning multipart methods at the colon character is a common 
        // convention within the Objective C community.
        NSString* contents = [NSString stringWithContentsOfFile: fullPath4
                                                   usedEncoding: &encoding
                                                          error: &error4];

        if ( error != nil ) {
           // [NSApp presentError:error4];
        }

        NSLog(@"Contents of '%@': %@", fileName, contents);

        // Mutability

        // You can't change NSString's content; but you can change NSMutableString

        NSMutableString* name = [NSMutableString stringWithString:@"Helen"];

        [name setString:@"Sarah"];
        [name setString:@"Daisy"];

        // NSMutableString is a subclass of NSString so you can use all the
        // NSString methods on it too.

        NSString* originalString = @"Friday";
        NSMutableString* editableString = [originalString mutableCopy];
        [editableString setString:@"Saturday"];
        [editableString release];

        // calling -copy on a mutable object returns a immutable copy
        // to get a mutable version use -mutableCopy instead.

//    const int * Constant2

//declares that Constant2 is a variable pointer to a constant integer and

//    int const * Constant2

//is an alternative syntax which does the same, whereas

//    int * const Constant3

//declares that Constant3 is constant pointer to a variable integer and

//    int const * const Constant4

//declares that Constant4 is constant pointer to a constant integer. Basically ‘const’ applies to whatever is on its immediate left (other than if there is nothing there in which case it applies to whatever is its immediate right).

        NSMutableString* const name5 = [NSMutableString stringWithString:@"Lea"];
        // OK: 'const' doesn't effect object mutability.
        [name5 setString:@"Sally"];
        // ERROR: can't change the object. (name is a constant pointer)
        // see: http://www.thegeekstuff.com/2012/06/c-constant-pointers/
        // http://www.codeguru.com/cpp/cpp/cpp_mfc/general/article.php/c6967/Constant-Pointers-and-Pointers-to-Constants.htm
        // http://duramecho.com/ComputerInformation/WhyHowCppConst.html

        //This is an error.
        //name5 = @"Sally";

        // This is a regular NSString not a mutable string, the LHS type
        // does not determine what it is.
        NSMutableString* name6 = @"Jane";

        // XCode/iOS Debugging Tips:
        // CMD + \ : to put a breakpoint (use conditional breakpoints too)
        // typing `po` in the console will give detail about the current object.
//        (lldb) po name
//                (NSMutableString *) $3 = 0x00000001049003d0 Daisy
//        (lldb) p name
//                (NSMutableString *) $4 = 0x00000001049003d0

// po [self view] recursiveDescription] -> will print out the view hierarchy.

// Logging lifecycle events is a great idea

//                - (id)init
//        {
//            self = [super init];
//            if (self)
//            {
//                NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
//            }
//            return self;
//        }
//        - (void)dealloc
//        {
//            NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
//        }
    }

    return 0;
}
