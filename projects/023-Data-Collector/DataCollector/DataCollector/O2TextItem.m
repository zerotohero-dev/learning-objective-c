/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2TextItem.h"

@interface O2TextItem ()

    // Privately redefine properties as writable.
    @property (copy, readwrite) NSString* typeName;

    // Private methods.
    + (NSString*) defaultTitle;
    + (NSString*) defaultAuthor;
@end

@implementation O2TextItem
    @synthesize contents;
    @synthesize title;
    @synthesize typeName;
    @synthesize author;

    - (id) init {
        if (self = [super init]) {
            self.contents = nil;
            self.title    = [[self class] defaultTitle];
            self.typeName = @"Text";
            self.author   = [[self class] defaultAuthor];
        }

        return self;
    }

    - (void) dealloc {
        self.contents = nil;
        self.title    = nil;
        self.typeName = nil;
        self.author   = nil;

        [super dealloc];
    }

    - (NSString*) description {
        return [NSString stringWithFormat:@"%@: %@", self.title, self.contents];
    }

    + (NSString*) defaultTitle {
        return @"Untitled";
    }

    + (NSString*) defaultAuthor {
        return @"Unattributed";
    }
@end
