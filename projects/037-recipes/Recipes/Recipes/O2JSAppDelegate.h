/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <UIKit/UIKit.h>
#import "O2JSRecipesListViewController.h"

@class O2JSViewController;

@interface O2JSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) O2JSViewController *viewController;

@property (nonatomic, strong) O2JSRecipesListViewController *viewController;
            
@property (copy, nonatomic) NSArray *recipes;

@end
