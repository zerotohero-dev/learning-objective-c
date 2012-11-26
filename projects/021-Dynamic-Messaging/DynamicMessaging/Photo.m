/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */
 
#import "Photo.h"

@implementation Photo
- (NSString*) caption {return @"hello";}
- (void) setAlbum:(MyAlbum*)album {;}
@end

/*
respondToSelector does not look at which methods the class declares in the 
header; it looks at which method the class actually implements.
This important since methods can be added at runtime, and respond to the 
selector without being defined in the header file.
*/