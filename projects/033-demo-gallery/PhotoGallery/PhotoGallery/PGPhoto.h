#import <Foundation/Foundation.h>
#import "PGAlbum.h"


@interface PGPhoto : NSManagedObject

// attributes.
@property (retain) NSString* filePath;
@property (retain) NSString* uniqueID;
@property (retain) NSNumber* orderIndex;

// relationships.
@property (retain) PGAlbum* album;

// non-modeled properties.
@property (readonly) NSImage* largeThumbnail;

// methods.
+ (PGPhoto *)photoInDefaultContext;
@end