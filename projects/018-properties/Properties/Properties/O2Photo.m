/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2Photo.h"
#import <Cocoa/Cocoa.h>

@interface MyClass : NSManagedObject
@property(nonatomic, retain) NSString* value;
@end

// NSManagedObject is provided by the Core Data framework.
// A managed object class has a corresponding schema that defines
// attributes and relationships for the class; at runtime,
// the Core Data framework generates accessor methods for these as necessary.
// You therefore typically declare properties for the attributes and
// relationships, but you don’t have to implement the accessor methods
// yourself and shouldn’t ask the compiler to do so (via @synthesize).
// If you just declared the property without providing any implementation,
// however, the compiler would generate a warning. Using @dynamic
// suppresses the warning.

/*
@implementation MyClass
@dynamic value;
@end
*/

@implementation O2Photo

// Synthesize automatically generates getters and setters, so all you have
// to implement is the deallo method.
// The good thing is, @synthesize only creates accessors that you do not
// define. So if you define your own custom getter after @synthesize
// that accessor will be used instead.
@synthesize caption;
@synthesize photographer;

// @synthesize will generate getter and setter methods for your property.
// @dynamic just tells the compiler that the getter and setter methods are
// implemented not by the class itself but somewhere else (like the superclass)


//@dynamic dynamicVariable;

@synthesize name=storedName;

+ (O2Photo*) photo {
    O2Photo* newPhoto = [[O2Photo alloc] init];
    return [newPhoto autorelease];
}
- (id) init {
    if (self = [super init]) {
        [self setCaption:@"Default Caption"];
        [self setPhotographer:@"Default Photographer"];
    }
    return self;
}
- (void) dealloc {
    [caption release];
    [photographer release];
    [name release];
    [_name dealloc];
    [_photographer dealloc];
    [_caption dealloc];
    [super dealloc];
}

@end
