#import <Cocoa/Cocoa.h>

@interface CBAlbum : NSManagedObject

@property (retain) NSString* title;
@property (retain) NSSet*    photos;

+ (id) defaultAlbum;
+ (id) albumInDefaultContext;

@end