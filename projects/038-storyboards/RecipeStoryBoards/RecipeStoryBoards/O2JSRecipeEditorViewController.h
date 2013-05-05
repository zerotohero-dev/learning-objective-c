/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <UIKit/UIKit.h>

#import "O2jsRecipe.h"

@interface O2JSRecipeEditorViewController : UIViewController

@property(nonatomic, strong) O2JSRecipe *recipe;

@property(nonatomic, strong) NSNumberFormatter *formatter;

@property(nonatomic, strong) IBOutlet UITextField *titleField;
@property(nonatomic, strong) IBOutlet UITextView  *directionsText;
@property(nonatomic, strong) IBOutlet UILabel     *prepTimeLabel;
@property(nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property(nonatomic, strong) IBOutlet UIStepper   *prepTimeStepper;

- (IBAction)changePreparationTime:(UIStepper *)sender;

@end
