/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <UIKit/UIKit.h>
#import "O2JSRecipe.h"

@interface O2JSViewController : UIViewController

/*
 * Views
 */
@property(nonatomic, strong) IBOutlet UILabel     *recipeTitle;
@property(nonatomic, strong) IBOutlet UITextView  *directionsView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;

/*
 * Models
 */
@property(nonatomic, strong) O2JSRecipe *recipe;

@end
