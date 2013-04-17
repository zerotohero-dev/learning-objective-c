//
// Created by volkan.ozcelik on 3/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PGAlbum : NSManagedObject
@property (retain) NSString* title;
@property (retain) NSSet* photos;

+ (id) defaultAlbum;
+ (id) albumInDefaultContext;
@end