//
// Created by volkan.ozcelik on 3/10/13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Quartz/Quartz.h>
#import "PGPhoto.h"
#import "PGAlbum.h"

@interface PGPhoto ()
@property (retain) NSImage* thumbnail;

- (void) generateUniqueID;
@end


@implementation PGPhoto

// use 'dynamic' for Core Data properties. @dynamic filePath;
//TODO:
@dynamic filePath;
@dynamic uniqueID;
@dynamic orderIndex;
@dynamic album;

// use 'synthesize' for normal properties.
@synthesize thumbnail;

- (void)dealloc {
    [super dealloc];
}

+ (PGPhoto *)photoInDefaultContext {
    NSManagedObjectContext* context = [[NSApp delegate] managedObjectContext];

    PGPhoto* newItem;
    newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];

    newItem.filePath = nil;

    return newItem;
}

- (NSImage*) largeThumbnail {
    // 'largeThumbnail' is used by the list view.

    if ( self.thumbnail) {
        return self.thumbnail;
    }

    NSSize size = NSMakeSize( 250, 250 );
    CFStringRef path = (CFStringRef) self.filePath;

    //TODO: NULL versus nil difference
    CFURLRef url = CFURLCreateWithFileSystemPath( NULL, path, kCFURLPOSIXPathStyle, NO);

    // use QuickLook to generate a thumbnail of the image.
    CGImageRef thumb = QLThumbnailImageCreate( NULL, url, size, nil );
    NSImage* image = [[NSImage alloc] initWithCGImage:thumb size:size];

    self.thumbnail = image;

    CFRelease( url );
    CFRelease( thumb );

    //TODO: autorelease/release difference.
    [image release];

    return image;

}

#pragma mark -
#pragma mark Core Data Methods
- (void) awakeFromInsert {
    // called when the object is first created.
    [self generateUniqueID];
}

#pragma mark -
#pragma mark 'IKImageBrowserItem' Protocol Methods

-(NSString *) imageTitle {
    NSString* fullFileName = self.filePath.lastPathComponent;
    return [fullFileName stringByDeletingPathExtension];
}

- (NSString*) imageUID {
    // return uniqueID if it exists.
    NSString* uniqueID = self.uniqueID;

    if ( uniqueID ) {
        return uniqueID;
    }

    [self generateUniqueID];

    return self.uniqueID;
}

- (NSString *) imageRepresentationType {
    return IKImageBrowserPathRepresentationType;
}

- (id) imageRepresentation {
    return self.filePath;
}

#pragma mark -
#pragma mark Private
- (void) generateUniqueID {
    NSString* uniqueID = self.uniqueID;
    if ( uniqueID != nil ) {
        return;
    }
    self.uniqueID = [[NSProcessInfo processInfo] globallyUniqueString];
}

//@interface NSObject (IKImageBrowserItem)
//- (NSString *) - (NSString *) - (id)
//- (NSUInteger) - (NSString *) - (NSString *) - (BOOL)
//@end
//imageUID; /* required */ imageRepresentationType; /* required */
//imageRepresentation;
//imageVersion; imageTitle; imageSubtitle; isSelectable;
///* required */

@end