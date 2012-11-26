/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */
 
#import <Foundation/Foundation.h>
// Using #include  will cause dupe def error:
// ref: http://stackoverflow.com/questions/5180232/duplicate-interface-declaration-for-class-test-coredataappdelegate
#import "Photo.h"
#import "MyAlbum.h"
#import "Dog.h"
#import "Cat.h"

// In Objective C, the term for a method (or message) name is "selector".
// Selectors are of SEL type and you can create them using @selector() syntax.
// You can think of them as "delegates" or "function pointers"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Photo* myPhoto = [[Photo alloc] init];
        MyAlbum* myAlbum = [[MyAlbum alloc] init];

        id dog = [[Dog alloc] init];
        [dog woof];
//        [dog a];
        [dog meow];
        
        [dog release];


        SEL captionSelector = @selector( caption );
        SEL albumSelector   = @selector( setAlbum: );
        SEL osmanSelector   = @selector( osman );

        if ([myPhoto respondsToSelector:captionSelector]) {
            NSLog(@"Calling '%@'", NSStringFromSelector(captionSelector));

            NSString* caption = [myPhoto performSelector:captionSelector];

            NSLog(@"Caption: %@", caption);
        } else {
            NSLog(@"nada1");
        }

        if ([myPhoto respondsToSelector:albumSelector]) {
            NSLog(@"Calling '%@'", NSStringFromSelector(albumSelector));

            [myPhoto performSelector:albumSelector withObject:myAlbum];
        } else {
            NSLog(@"nada2");
        }

        if ([myPhoto respondsToSelector:osmanSelector]) {
            NSLog(@"Calling '%@'", NSStringFromSelector(osmanSelector));

            [myPhoto performSelector:osmanSelector];
        } else {
            NSLog(@"nada3");
        }

        [myPhoto release];
        [myAlbum release];
    }
    
    return 0;
}

