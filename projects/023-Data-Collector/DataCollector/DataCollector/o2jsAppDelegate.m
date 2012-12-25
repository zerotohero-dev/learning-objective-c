/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "o2jsAppDelegate.h"
#import "O2DataGroup.h"
#import "O2TextItem.h"

@implementation o2jsAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    O2DataGroup* textGroup = [[O2DataGroup alloc] init];
    textGroup.name = @"Text Items";

    O2TextItem* item1 = [[O2TextItem alloc] init];
    item1.contents = @"We are a way for the universe to know itself.";
    item1.title = @"Carl Sagan on the Universe";
    item1.author = @"Carl Sagan";

    O2TextItem* item2 = [[O2TextItem alloc] init];
    item2.contents = @"Heard melodies are sweet, but those unheard are sweeter.";
    item2.title = @"John Keats on What is Heard";
    item2.author = @"John Keats";

    O2TextItem* item3 = [[O2TextItem alloc] init];
    item3.contents = @"I owe my success to the fact that I never had a clock in my workroom.";
    item3.title = @"Thomas Edison on Clocks";
    item3.author = @"Thomas Edison";

    [textGroup addItem:item1];
    [textGroup addItem:item2];
    [textGroup addItem:item3];

    [item1 release];
    [item2 release];
    [item3 release];

    O2DataGroup* appsGroup = [O2DataGroup runningApplicationsDataGroup];

    NSLog ( @"%@", textGroup );
    NSLog ( @"%@", appsGroup );

    [textGroup release];
}

@end
