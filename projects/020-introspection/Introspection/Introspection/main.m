/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>
#include "O2Photo.h"

@interface Media : NSObject

@property (copy) NSString* author;

+(id) currentObject;

@end

@interface Movie : Media

// Primitive types do not have retain counts, so you cannot (copy) or (retain)
// them. Primitive types are lexically scoped, so once the owner object is dead
// the memory allocated for the type is gone too; or for the local variable case
// once you exit the function, the variable will be removed from the function's
// execution stack.
// The (assign) keyword -- which is the default == will generate a setter
// which assigns the value to the instance variable directly, rather than
// copying or retaining it. This is best for primitive types
// like NSInteger and CGFloat, or objects you don't
// directly own, such as delegates.
@property (assign) float framesPerSecond;

@end

@implementation Media

@synthesize author;

+(id) currentObject {
    return [[[[self class] alloc] init] autorelease];
}

@end

@implementation Movie

@synthesize framesPerSecond;

@end

@protocol IconViewInfo <NSObject>
    - (NSString*) title;
    - (NSString*) fileName;
    - (NSString*) summary;
    @optional
    - (NSString*) author;
    - (id) previewData;
@end

@interface Bookmark : NSObject <IconViewInfo>
    @property (copy) NSString* siteName;
    @property (copy) NSString* url;
@end

@interface Photo : Media <IconViewInfo>
    @property (copy) NSString* caption;
    @property (copy) NSString* photographer;
@end

@implementation Bookmark
    @synthesize siteName;
    @synthesize url;

    -(NSString*) title {
        return self.siteName;
    }
    -(NSString *) fileName {
        return [self.siteName stringByAppendingPathExtension:@"webloc"]; }
    -(NSString *) summary {
        return [NSString stringWithFormat:@"'%@' at %@", self.siteName, self.url];
    }
@end

@implementation Photo
    @synthesize caption;
    @synthesize photographer;

    -(NSString *) title { return self.caption; }
    -(NSString *) fileName {
        return [self.caption stringByAppendingPathExtension:@"jpg"];
    }
    -(NSString *) summary {
        return [
            NSString stringWithFormat:@"'%@' by %@",
                self.caption, self.photographer];
    }
@end

void addLauncherItem(id <IconViewInfo> newItem) {
    NSLog(@"%@ %@ %@", [newItem title], [newItem fileName], [newItem summary]);
}

@interface NSString (IconView) <IconViewInfo> - (NSString*) title;
- (NSString*) fileName;
- (NSString*) summary;
@end
@implementation NSString (IconView)
- (NSString*) title {
return self; }
- (NSString*) fileName {
return [self stringByAppendingPathExtension:@"txt"];
}
- (NSString*) summary {
return [@"Summary: " stringByAppendingString: self]; }
@end

int main(int argc, const char * argv[]) {

    Bookmark* item = [[Bookmark alloc] init];
    item.siteName = @"http://o2js.com/";
    item.url      = @"http://o2js.com/";

    addLauncherItem(item);

    [item release];

    Photo* photo = [[Photo alloc] init];

    photo.caption = @"hello";
    photo.photographer = @"Volkan Ozcelik";

    NSString* osman = @"osman";

    addLauncherItem(photo);

    id movie = [Movie currentObject];
//    id media = [Media currentObject];

    BOOL isMedia = [movie isMemberOfClass:[Media class]];
    BOOL isKind  = [movie isKindOfClass:[Media class]];

    id test = [O2Photo photo];

    if (isMedia) {
        NSLog(@"Instance of Media");
    }

    if (isKind) {
        NSLog(@"Kind of Media");
    }

    BOOL isPhoto = [test isMemberOfClass:[O2Photo class]];

    if (isPhoto) {
        NSLog(@"valid photo");
        NSLog(@"ClassName %@", [test className]);
    }

    return 0;
}

