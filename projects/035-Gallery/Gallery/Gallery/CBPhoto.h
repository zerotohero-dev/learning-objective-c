#import <Cocoa/Cocoa.h>

@class CBAlbum;

@interface CBPhoto : NSManagedObject

// attributes
@property (retain) NSString* filePath;
@property (retain) NSString* uniqueID;
@property (retain) NSNumber* orderIndex;

// relationships
@property (retain) CBAlbum*  album;

// non-modeled properties
@property (readonly) NSImage* largeThumbnail;

// methods
+ (id) photoInDefaultContext;

@end