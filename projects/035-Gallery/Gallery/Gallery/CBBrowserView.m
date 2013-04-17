#import "CBBrowserView.h"
#import "CBPhoto.h"
#import "CBAlbum.h"
#import "CBEditorView.h"
#import "CBMainWindow.h"


@interface CBBrowserView (Private)
- (void) setupImageBrowser;
- (void) updateSortOrderForObjects:(NSArray*)items;
@end


@implementation CBBrowserView

@synthesize mainWindowController;
@synthesize imageBrowser;
@synthesize albumsTable;
@synthesize albumsArrayController;
@synthesize imagesArrayController;
@synthesize imagesSortDescriptors;
@synthesize thumbnailScale;


- (void) loadView {
    
    [super loadView];
    
    NSSortDescriptor* sort;
    sort = [NSSortDescriptor sortDescriptorWithKey: @"orderIndex"
                                         ascending: YES];
    
    self.imagesSortDescriptors = [NSArray arrayWithObject:sort];    
    self.albumsTable.delegate  = self;
    [self setupImageBrowser];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    
    NSTableView* table     = [notification object];
    NSInteger    selection = table.selectedRow;
    NSArray*     albums    = [self.albumsArrayController arrangedObjects];

    CBAlbum* album = [albums objectAtIndex:selection];
    [[NSApp delegate] setValue:album forKey:@"selectedAlbum"];
}



#pragma mark -
#pragma mark Image Browser

- (void) imageBrowser: (IKImageBrowserView *)browser
         cellWasDoubleClickedAtIndex: (NSUInteger)index {
    
    NSArray* visiblePhotos = [self.imagesArrayController arrangedObjects];
    CBPhoto* photo         = [visiblePhotos objectAtIndex:index];
    
    CBMainWindow* window = self.mainWindowController;
    id editor = [window viewControllerForName:@"CBEditorView"];
    
    if ( [editor isKindOfClass:[CBEditorView class]] )
        [(CBEditorView*)editor editPhoto:photo];
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    
    IKImageBrowserView* browser = self.imageBrowser;
    
    NSPasteboard* pboard    = [sender draggingPasteboard];
    NSUInteger    dropIndex = [browser indexAtLocationOfDroppedItem];
    NSArray*      photos    = self.imagesArrayController.arrangedObjects;
    
    // indexes to place photos.
    NSMutableIndexSet* indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:dropIndex];
    
    // the move might be within the view.
    if ( [sender draggingSource] == browser ) {
        
        NSIndexSet*     selected        = browser.selectionIndexes;
        NSArray*        draggingItems   = [photos objectsAtIndexes:selected];
        NSMutableArray* reorderedItems  = [photos mutableCopy];
        
        [reorderedItems removeObjectsInArray:draggingItems];
        
        NSUInteger newDropIndex = dropIndex;        
        NSUInteger index        = 0;
        NSUInteger firstIndex   = selected.firstIndex;
        
        for ( index = firstIndex; index != NSNotFound;
                index = [selected indexGreaterThanIndex:index] ) {
            
            if ( index < dropIndex )
                newDropIndex -= 1;
            else
                break;
        }
        
        NSRange     dropRange   = NSMakeRange( newDropIndex, draggingItems.count );
        NSIndexSet* dropIndexes = [NSIndexSet indexSetWithIndexesInRange:dropRange];
        
        [reorderedItems insertObjects:draggingItems atIndexes:dropIndexes];
        [self updateSortOrderForObjects:reorderedItems];
        [reorderedItems release];
        return YES;
    }
    
         
    NSMutableArray* newItems = [NSMutableArray array];
    CBAlbum* album = [[NSApp delegate] valueForKey:@"selectedAlbum"];
    

    // get list of files.
    NSArray*  fileNames  = [pboard propertyListForType:NSFilenamesPboardType];
    NSInteger indexCount = 0;    
    if ( fileNames.count < 1 ) return NO;    
   
    for ( NSString* file in fileNames ) {
        
        CBPhoto* newItem  = [CBPhoto photoInDefaultContext];
        newItem.filePath  = file;
        [newItems addObject:newItem];
        [indexSet addIndex: dropIndex+indexCount];
        newItem.album = album;
        indexCount++;
    }
    
    NSMutableArray* array = [photos mutableCopy];
    [array insertObjects:newItems atIndexes:indexSet];    
    [self updateSortOrderForObjects:array];
    [array release];
    
    return YES;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    return NSDragOperationCopy;
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender {
    return NSDragOperationCopy;
}


#pragma mark -
#pragma mark Private

- (void) setupImageBrowser {
    
    IKImageBrowserView* browser = self.imageBrowser;
    browser.draggingDestinationDelegate = self;
    browser.delegate       = self;
    browser.cellsStyleMask = (IKCellsStyleShadowed|IKCellsStyleTitled);
    browser.zoomValue      = 0.55;
    
    // base attributes.
    NSFont*  font         = [NSFont systemFontOfSize:11];
    NSColor* textColor    = [NSColor colorWithCalibratedWhite:0.8 alpha:1.0];
    NSColor* textColorAlt = [NSColor colorWithCalibratedWhite:1.0 alpha:1.0];
    NSColor* background   = [NSColor colorWithCalibratedWhite:0.2 alpha:1.0];
    
    // text attributes.
    NSMutableDictionary* attr;
    attr = [NSMutableDictionary dictionary];
    [attr setObject:textColor forKey:NSForegroundColorAttributeName];
    [attr setObject:font forKey:NSFontAttributeName];
    
    // selected text attributes.
    NSMutableDictionary* attrAlt;
    attrAlt = [NSMutableDictionary dictionary];
    [attrAlt setObject:textColorAlt forKey:NSForegroundColorAttributeName];
    [attrAlt setObject:font forKey:NSFontAttributeName];
    
    // set text attributes.
    [browser setValue: attr
               forKey: IKImageBrowserCellsTitleAttributesKey];
    [browser setValue: attrAlt
               forKey: IKImageBrowserCellsHighlightedTitleAttributesKey];
    [browser setValue: background
               forKey: IKImageBrowserBackgroundColorKey];
}

- (void) updateSortOrderForObjects:(NSArray*)items {
    
    NSMutableArray* arrangedItems = [NSMutableArray array];
    NSInteger       orderIndex    = 0;
    
    for ( CBPhoto* item in items ) {        
        // only do each item once.
        if ( [arrangedItems containsObject:item] ) continue;        
        item.orderIndex = [NSNumber numberWithInteger:orderIndex];
        [arrangedItems addObject:item];
        orderIndex++;
    }
    
    // reload the array controller.
    [self.imagesArrayController rearrangeObjects];
}

- (void) dealloc {
 
    self.imageBrowser           = nil;
    self.albumsTable            = nil;
    self.albumsArrayController  = nil;
    self.imagesArrayController  = nil;
    self.imagesSortDescriptors  = nil;
    
    [super dealloc];
}
@end