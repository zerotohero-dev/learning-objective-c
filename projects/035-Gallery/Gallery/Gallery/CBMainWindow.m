#import "CBMainWindow.h"

// the 'static' means these are only visible in this file.
static const NSInteger BrowserViewIndex = 0;
static const NSInteger EditorViewIndex  = 1;
static const NSInteger ListViewIndex    = 2;

// names for each view.
static NSString* const CBBrowserViewName = @"CBBrowserView";
static NSString* const CBEditorViewName  = @"CBEditorView";
static NSString* const CBListViewName    = @"CBListView";

@implementation CBMainWindow

// view modes.
@synthesize viewSelectionControl;
@synthesize viewControllers;
@synthesize currentViewController;
@synthesize controllerNamesByIndex;


- (void) loadWindow {
    
    [super loadWindow];
    self.viewControllers = [NSMutableDictionary dictionary];        

    // match up indexes to names.
    NSMutableArray* names = [NSMutableArray array];
    [names insertObject:CBBrowserViewName atIndex:BrowserViewIndex];
    [names insertObject:CBEditorViewName  atIndex:EditorViewIndex];
    [names insertObject:CBListViewName    atIndex:ListViewIndex];
    self.controllerNamesByIndex = names;
    
    // start on browser mode.
    NSViewController* initial;
    initial = [self viewControllerForName:CBBrowserViewName];
    [self activateViewController:initial];
}

- (IBAction) viewSelectionDidChange:(id)sender {
    
    // find requested view controller.
    NSInteger selection       = [sender selectedSegment];
    NSArray*  names           = self.controllerNamesByIndex;
    NSString* controllerName  = [names objectAtIndex:selection];

    // load view controller.
    NSViewController* controller;
    controller = [self viewControllerForName:controllerName];    
    [self activateViewController:controller];
}

- (void) activateViewController: (NSViewController*)controller {

    NSArray*  names       = self.controllerNamesByIndex;    
    NSInteger segment     = self.viewSelectionControl.selectedSegment;
    
    NSString* targetName  = [controller className];
    NSInteger targetIndex = [names indexOfObject:targetName];
    
    // update segmented control.
    if ( segment != targetIndex )
        [self.viewSelectionControl setSelectedSegment:targetIndex];  
    
    // remove current view.
    [self.currentViewController.view removeFromSuperview];
    
    // setup new view controller.
    self.currentViewController = controller;
    [[self.window contentView] addSubview:controller.view];
    
    // adjust for window margin.
    NSWindow* window = self.window;
    CGFloat padding = [window contentBorderThicknessForEdge:NSMinYEdge];    
    NSRect frame    = [window.contentView frame];
    frame.size.height -= padding;
    frame.origin.y += padding;
    controller.view.frame = frame;
}

- (NSViewController*) viewControllerForName: (NSString*)name {
    
    // see if this view already exists.
    NSMutableDictionary* allControllers = self.viewControllers;
    NSViewController* controller = [allControllers objectForKey:name];
    if ( controller ) return controller;
    
    // create a new instance of the view.
    Class controllerClass = NSClassFromString( name );
    controller = [[controllerClass alloc] initWithNibName:name bundle:nil];
    [allControllers setObject:controller forKey:name];
    
    // use key-value coding to avoid compiler warnings.
    [controller setValue:self forKey:@"mainWindowController"];
    return [controller autorelease];
}

- (void) dealloc {
 
    self.viewSelectionControl   = nil;
    self.viewControllers        = nil;
    self.controllerNamesByIndex = nil;
    
    [super dealloc];
}

@end