#import "PGMainWindow.h"

// TODO: what is static used for.
// the 'static' means these are only visible in this file.
static const NSInteger BrowserViewIndex = 0;
static const NSInteger EditorViewIndex = 1;
static const NSInteger ListViewIndex = 2;

// names for each view.
static NSString* const BrowserViewName = @"PGBrowserView";
static NSString* const EditorViewName = @"PGEditorView";
static NSString* const ListViewName = @"PGListView";

@interface PGMainWindow ()

@end

@implementation PGMainWindow

// view modes.
@synthesize viewSelectionControl;
@synthesize viewControllers;
@synthesize currentViewController;
@synthesize controllerNamesByIndex;

- (void)loadWindow {
    [super loadWindow];

    self.viewControllers = [NSMutableDictionary dictionary];

    // match up indexes to names.
    NSMutableArray* names = [NSMutableArray array];

    [names insertObject:BrowserViewName atIndex:BrowserViewIndex];
    [names insertObject:EditorViewName atIndex:EditorViewIndex];
    [names insertObject:ListViewName atIndex:ListViewIndex];

    self.controllerNamesByIndex = names;

    // start on browser mode.
    NSViewController* initial;
    initial = [self viewControllerForName:BrowserViewName];

    [self activateViewController:initial];
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)viewSelectionDidChange:(id)sender {

    // find requested view controller.
    NSInteger selection = [sender selectedSegment];
    NSArray* names = self.controllerNamesByIndex;
    NSString* controllerName = [names objectAtIndex:selection];

    // load view controller.
    NSViewController* controller;
    controller = [self viewControllerForName:controllerName];

    [self activateViewController:controller];
}

- (void)activateViewController:(NSViewController *)controller {
    NSArray* names = self.controllerNamesByIndex;
    NSInteger segment = self.viewSelectionControl.selectedSegment;
    NSString* targetName = [controller className];
    NSInteger targetIndex = [names indexOfObject:targetName];

    // update segmented control.
    if ( segment != targetIndex ) {
        [self.viewSelectionControl setSelectedSegment:targetIndex];
    }

    // remove current view.
    [self.currentViewController.view removeFromSuperview];

    // set up new view controller.
    self.currentViewController = controller;

    // TODO: self.window?
    [[self.window contentView] addSubview:controller.view];

    // adjust for window margin.
    NSWindow* window = self.window;

    CGFloat padding = [window contentBorderThicknessForEdge:NSMinYEdge];
    NSRect frame = [window.contentView frame];

    frame.size.height -= padding;
    frame.origin.y += padding;

    controller.view.frame = frame;
}

- (NSViewController *)viewControllerForName:(NSString *)name {
    // see if this view already exists.
    NSMutableDictionary* allControllers = self.viewControllers;

    NSViewController* controller = [allControllers objectForKey:name];

    if (controller) {
        return controller;
    }

    // create a new instance of the view.
    Class controllerClass = NSClassFromString(name);

    controller = [[controllerClass alloc] initWithNibName:name bundle:nil];

    [allControllers setObject:controller forKey:name];

    // use key-value coding to avoid compiler warnings.
    [controller setValue:self forKey:@"mainWindowController"];

    return [controller autorelease];
}

- (void)dealloc {
    self.viewSelectionControl = nil;
    self.viewControllers = nil;
    self.controllerNamesByIndex = nil;

    [super dealloc];
}


@end
