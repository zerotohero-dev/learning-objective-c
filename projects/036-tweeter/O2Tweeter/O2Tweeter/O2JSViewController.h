/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <UIKit/UIKit.h>

@interface O2JSViewController : UIViewController {
//    IBOutlet UIWebView *twitterWebView;
}

// For any UIKit property we can set nonatomic, because UIKit methods and
// properties should only ever be accessed from the main thread; thread safety
// is not an issue. There will never be two threads attempting to set the property.
//
// strong is the owning reference, meaning that it retains its object.
// weak is like `assign` and it does not affect the object's retain count.
// however when the weak property of an object is freed it becomes nil, and we
// still can call methods on it. (in assign the reference would become a dangerous
// dangling pointer)
// http://stackoverflow.com/questions/8927727/objective-c-arc-strong-vs-retain-and-weak-vs-assign
// http://developer.apple.com/library/mac/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html
// http://jonathanhui.com/ios-5-programming-xcode

/*
The framework SDK can be divided into four layers:

Cocoa Touch Layer:
    The top-level abstractions over applications and their UIs. 
    (UIKit, MapKit, GameKit)
Media Layer:
    Graphics, sound, and video framework
Core Services:
    Frameworks for essential non-ui functionality (app purchase: StoreKit,
    orientation sensing: CoreMotion etc.)
Core OS:
    Low-level libraries and frameworks needed by the uppoer layers.
    
    
UIApplication is the point of contact between our code, and the rest of the system.
    .sharedApplication
    
UIApplicationDelegate
    has callbacks for common events that occur. (google: delegate pattern
    it's an alternative to subclassing.
    
    for certain responsibilities, and object can delegate its behavior to another 
    object)
    
    View:
        insertSubView:atIndex
        frame: CGRect <CGPoint, CGSize>

UIViewController
    You put the logic of your UI here.
    it has a number of lifecycle callbacks
    
UIFont
UIImage

-- Foundation Classes -- (it's imported by UIKit, no need to import it if you use
UIKit)

NSString is also used for composing and parsing path segments
NSArray
NSDictionary -- members of collections must be objective C objects
NSNumber -> Numeric
NSData -> Byte buffers
NSValue -> for any value
NSNull -> since you cannot add nil to collections.
    NSArray:initWithObjects
    NSDictionary:initWithObjects:forKeys:

 */

@end
