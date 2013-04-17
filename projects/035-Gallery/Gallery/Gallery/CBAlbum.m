#import "CBAlbum.h"

@implementation CBAlbum

// use 'dynamic' for Core Data properties.
@dynamic title;
@dynamic photos;

+ (id) albumInDefaultContext {
    
    NSManagedObjectContext* context = 
      [[NSApp delegate] managedObjectContext];
    
    CBAlbum* newItem;    
    newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Album"
                                            inManagedObjectContext:context];
    
    return newItem;
}

+ (id) defaultAlbum {
 
    NSManagedObjectContext* context = 
      [[NSApp delegate] managedObjectContext];

    NSEntityDescription* entity  
       = [NSEntityDescription entityForName: @"Album"
                     inManagedObjectContext: context];
    
    // create a fetch request to find 'Default' album.
    NSFetchRequest* fetch   = [[NSFetchRequest alloc] init];
    fetch.entity            = entity;
    fetch.predicate         
      = [NSPredicate predicateWithFormat:@"title == 'Default'"];
    
    // run fetch and make sure it succceeded.
    NSError* error = nil;
    NSArray* results = [context executeFetchRequest:fetch error:&error];
    [fetch release];
    if ( error ) {
        NSLog( @"error: %@", error );
        return nil;
    }
    
    // create the album if it doesn't exist.
    CBAlbum* album = nil;
    if ( results.count > 0 ) {
        album = [results objectAtIndex:0];
    } else {
        album = [self albumInDefaultContext];
        album.title = @"Default";
    }
    
    return album;
}

// used by the list view.
- (NSImage*) image {
    return [NSImage imageNamed:NSImageNameFolder];
}

@end